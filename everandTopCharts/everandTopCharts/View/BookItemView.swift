//
//  BookItemView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI

struct BookItemView: View {
    let index: Int
    
    var body: some View {
        HStack {
            Text("\(index + 1). ")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
            Image(systemName: "book.closed.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 50, maxHeight: 50)
            VStack(spacing: 2) {
                Text("Book Title")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Book Author")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 2) {
                    let numOfStars: Int = 4
                    ForEach(1...numOfStars, id: \.self) { _ in
                        Image(systemName: "star.fill")
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