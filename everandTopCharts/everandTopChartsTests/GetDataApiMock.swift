//
//  GetDataApiMock.swift
//  everandTopChartsTests
//
//  Created by banie setijoso on 2024-04-15.
//

import Foundation
@testable import everandTopCharts

class GetDataApiMock: GetDataApi {
    var dataResult: Result<Data, ApiError>?
    
    func get(from fileName: String) -> Result<Data, ApiError> {
        dataResult ?? .failure(.dataContentError)
    }
}
