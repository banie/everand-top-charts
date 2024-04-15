//
//  BookListItemView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI
import SwiftData

enum BookListFilter {
    case none
    case eBook
    case audioBook
}

struct BookListItemView: View {
    @Query private var books: [BookModel]
    
    init(bookFilter: BookListFilter = .none) {
        let eBookRawValue = BookType.eBook.rawValue
        let audioBookRawValue = BookType.audioBook.rawValue
        
        switch bookFilter {
        case .none:
            _books = Query(filter: #Predicate<BookModel> { book in
                book.type == eBookRawValue || book.type == audioBookRawValue
            }, sort: [SortDescriptor(\BookModel.title)])
            
        case .audioBook:
            _books = Query(filter: #Predicate<BookModel> { book in
                book.type == audioBookRawValue
            }, sort: [SortDescriptor(\BookModel.title)])
            
        case .eBook:
            _books = Query(filter: #Predicate<BookModel> { book in
                book.type == eBookRawValue
            }, sort: [SortDescriptor(\BookModel.title)])
        }
    }

    var body: some View {
        ForEach(books.indices, id: \.self) { index in
            BookItemView(index: index, book: books[index])
                .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    BookListItemView()
        .modelContainer(for: BookModel.self, inMemory: true)
}

