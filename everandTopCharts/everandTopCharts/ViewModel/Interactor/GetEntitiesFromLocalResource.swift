//
//  GetEntitiesFromLocalResource.swift
//  Guidomia
//
//  Created by Banie Setijoso on 2023-02-03.
//

import Foundation

class GetEntitiesFromLocalResource {
    private let getDataApi: GetDataApi
    private let decoder: JSONDecoder
    
    init(getDataApi: GetDataApi = GetDataFromLocalResource()) {
        self.getDataApi = getDataApi
        decoder = JSONDecoder()
    }
    
    func get<T>(from fileName: String) async -> Result<T, ApiError> where T: Decodable {
        let data: Data
        switch await getDataApi.get(from: fileName) {
        case .success(let dataResult):
            data = dataResult
        case .failure(let error):
            return .failure(error)
        }
        
        do {
            let items = try decoder.decode(T.self, from: data)
            return .success(items)
        } catch {
            print("not able to parse the items from filePath: \(fileName), error: \(error)")
            return .failure(.parsingError)
        }
    }
}
