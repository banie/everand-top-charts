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
    
    @State private var showFilterView = false

    var body: some View {
        NavigationSplitView {
            VStack(spacing: 0) {
                Divider()
                    .padding(.bottom, 0)
                
                List {
                    Text("The most popular books and audiobooks generating buzz from critics, NYT and more.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .listRowSeparator(.hidden)
                    
                    Button(action: {
                        withAnimation {
                            showFilterView.toggle()
                        }
                    }) {
                        HStack {
                            Text("Formats")
                                .font(.caption)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .fontWeight(.heavy)
                                .frame(maxWidth: 10, maxHeight: 5)
                        }
                    }
                    .borderedCapsuledButton()
                    .listRowSeparator(.hidden)
 
                    ForEach(viewModel.books.indices, id: \.self) { index in
                        BookItemView(index: index, book: viewModel.books[index])
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Top Chart")
            .navigationBarTitleDisplayMode(.inline)
            
//            if showFilterView {
//                GeometryReader { reader in
//                    VStack {
//                        Spacer()
//                        FilterBooksView()
//                    }
//                }
//                .transition(.move(edge: .bottom))
//            }
            
            if showFilterView {
                FilterBooksView()
                    .transition(.move(edge: .bottom))
            }
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
