//
//  Item.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-12.
//

import Foundation
import SwiftData

@Model
final class BookModel {
    @Attribute(.unique) let id: Int
    let title: String
    let author: String
    let rating: Int
    let type: String
    
    init(id: Int, title: String, author: String, rating: Int, type: BookType) {
        self.id = id
        self.title = title
        self.author = author
        self.rating = rating
        self.type = type.rawValue
    }
}

