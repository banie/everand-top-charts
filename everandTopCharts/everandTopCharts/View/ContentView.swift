//
//  ContentView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var books: [Book]
    @StateObject var viewModel: TopChartViewModel

    var body: some View {
        NavigationSplitView {
            VStack {
                Divider()
                List {
                    Text("The most popular books and audiobooks generating buzz from critics, NYT and more.")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(viewModel.books.indices, id: \.self) { index in
                        BookItemView(index: index, book: viewModel.books[index])
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Top Chart")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select an item")
        }.onAppear() {
            viewModel.load()
        }
    }
}

#Preview {
    ContentView(viewModel: TopChartViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}
