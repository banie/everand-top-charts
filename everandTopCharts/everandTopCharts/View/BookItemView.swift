//
//  BookItemView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI

struct BookItemView: View {
    let index: Int
    let book: Book
    
    var body: some View {
        HStack {
            Text("\(index + 1). ")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
            Image(systemName: "book.closed.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 50, maxHeight: 50)
                .foregroundColor(.secondary)
            VStack(spacing: 2) {
                Text(book.title)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(book.author)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 2) {
                    let numOfStars: Int = book.rating
                    ForEach(1...numOfStars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(maxWidth: 12, maxHeight: 12)
                            .padding(2)
                    }
                }
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.yellow)
            }
            .padding(.leading, 10)
        }
    }
}
