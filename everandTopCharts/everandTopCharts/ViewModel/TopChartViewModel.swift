//
//  TopChartViewModel.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import Foundation

@MainActor
class TopChartViewModel: ObservableObject {
    @Published var books: [Book]
    
    private let getBooksApi: GetBooksApi

    init(getBooksApi: GetBooksApi = GetBooksFromResource()) {
        self.getBooksApi = getBooksApi
        self.books = []
    }
    
    func load() {
        Task {
            switch getBooksApi.getListOfBooks() {
            case .success(let books):
                self.books = books
            case .failure:
                // TODO: show error toast here
                print("Technical error")
            }
        }
    }
}
