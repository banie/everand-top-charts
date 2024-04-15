//
//  TopChartViewModel.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import Foundation
import SwiftData

@MainActor
class TopChartViewModel: ObservableObject {
    private let modelContext: ModelContext
    private let getBooksApi: GetBooksApi

    init(modelContext: ModelContext, getBooksApi: GetBooksApi = GetBooksFromResource()) {
        self.modelContext = modelContext
        self.getBooksApi = getBooksApi
    }
    
    func load() {
        Task {
            switch await getBooksApi.getListOfBooks() {
            case .success(let books):
                for book in books {
                    modelContext.insert(
                        BookModel(id: book.id, 
                                  title: book.title,
                                  author: book.author,
                                  rating: book.rating,
                                  type: book.type))
                }
            case .failure:
                // TODO: show error toast here
                print("Technical error")
            }
        }
    }
}
