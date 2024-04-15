//
//  GetFromLocalResourceTests.swift
//  everandTopChartsTests
//
//  Created by banie setijoso on 2024-04-12.
//

import XCTest
@testable import everandTopCharts

final class GetFromLocalResourceTests: XCTestCase {

    private var apiMock: GetDataApiMock!
    private var interactor: GetEntitiesFromLocalResource!

    override func setUpWithError() throws {
        apiMock = GetDataApiMock()
        interactor = GetEntitiesFromLocalResource(getDataApi: apiMock)
    }

    override func tearDownWithError() throws {
        apiMock.dataResult = nil
    }

    func testDecoding() throws {
        let sampleResponse = """
        [
               {"id": 43, "title": "The Handmaid's Tale", "author": "Margaret Atwood", "rating": 4, "type": "eBook"},
               {"id": 44, "title": "Little Women", "author": "Louisa May Alcott", "rating": 3, "type": "audioBook"}
        ]
        """.data(using: .utf8)!
        
        apiMock.dataResult = .success(sampleResponse)
        
        let result: Result<[Book], ApiError> = interactor.get(from: "dummy_path")
        
        if case let .success(books) = result {
            XCTAssertEqual(2, books.count)
            XCTAssertEqual(44, books.last?.id)
            XCTAssertEqual("The Handmaid's Tale", books.first?.title)
            XCTAssertEqual("Louisa May Alcott", books.last?.author)
            XCTAssertEqual(4, books.first?.rating)
            XCTAssertEqual(BookType.audioBook, books.last?.type)
        } else {
            XCTAssertFalse(true)
        }
    }
}
