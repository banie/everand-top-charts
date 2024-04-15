//
//  GetDataFromLocalResource.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-15.
//

import Foundation

protocol GetDataApi {
    func get(from fileName: String) async -> Result<Data, ApiError>
}

class GetDataFromLocalResource: GetDataApi {
    
    func get(from fileName: String) async -> Result<Data, ApiError> {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("not able to construct path with filename: \(fileName)")
            return .failure(.invalidPath)
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            return .success(data)
        } catch {
            print("not able to form Data object from the content from filePath: \(fileName), error: \(error)")
            return .failure(.dataContentError)
        }
    }
}
