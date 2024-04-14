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
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                Text("The most popular books and audiobooks generating buzz from critics, NYT and more.")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(items.indices, id: \.self) { index in
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
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Top Chart")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
