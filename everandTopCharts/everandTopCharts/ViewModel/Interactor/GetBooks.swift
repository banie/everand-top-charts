//
//  GetCarListApi.swift
//  Guidomia
//
//  Created by Banie Setijoso on 2023-02-03.
//

import Foundation

protocol GetBooksApi {
    func getListOfBooks() async -> Result<[Book], ApiError>
}

class GetBooksFromResource: GetBooksApi {
    private let getRequestApi: GetEntitiesFromLocalResource
    
    init(getRequestApi: GetEntitiesFromLocalResource = GetEntitiesFromLocalResource()) {
        self.getRequestApi = getRequestApi
    }
    
    func getListOfBooks() async -> Result<[Book], ApiError> {
        return await getRequestApi.get(from: "book_list")
    }
}
