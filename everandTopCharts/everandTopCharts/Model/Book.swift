//
//  Book.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import Foundation

enum BookType: String, Codable {
    case eBook = "eBook"
    case audioBook = "audioBook"
}

struct Book: Codable, Identifiable {
    let id: Int
    let title: String
    let author: String
    let rating: Int
    let type: BookType
}
