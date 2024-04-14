//
//  GetFromLocalResource.swift
//  Guidomia
//
//  Created by Banie Setijoso on 2023-02-03.
//

import Foundation

class GetFromLocalResource {
    let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
    }
    
    func get<T>(from fileName: String) -> Result<T, ApiError> where T: Decodable {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("not able to construct path with filename: \(fileName)")
            return .failure(.invalidPath)
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let items = try decoder.decode(T.self, from: data)
            return .success(items)
        } catch {
            print("not able to parse the items from filePath: \(fileName), error: \(error)")
            return .failure(.parsingError)
        }
    }
}
