//
//  GetCarListApi.swift
//  Guidomia
//
//  Created by Banie Setijoso on 2023-02-03.
//

import Foundation

public enum ApiError: Error {
    case invalidPath
    case invalidUrl
    case parsingError
}

protocol GetBooksApi {
    func getListOfBooks() -> Result<[Book], ApiError>
}

class GetBooksFromResource: GetBooksApi {
    private let getRequestApi: GetFromLocalResource
    
    init(getRequestApi: GetFromLocalResource = GetFromLocalResource()) {
        self.getRequestApi = getRequestApi
    }
    
    func getListOfBooks() -> Result<[Book], ApiError> {
        return getRequestApi.get(from: "book_list")
    }
}
