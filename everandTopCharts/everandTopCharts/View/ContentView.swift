//
//  ContentView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel: TopChartViewModel
    
    @State private var appliedEbookSelected = false
    @State private var appliedAudiobookSelected = false
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
                    
                    HStack {
                        Button(action: {
                            withAnimation {
                                showFilterView.toggle()
                            }
                        }) {
                            HStack {
                                Text(getFilterText())
                                    .font(.caption)
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .fontWeight(.heavy)
                                    .frame(maxWidth: 10, maxHeight: 5)
                            }
                        }
                        .borderedCapsuledButton()
                        .sheet(isPresented: $showFilterView) {
                            FilterBooksView(appliedEbookSelected: $appliedEbookSelected,
                                            appliedAudiobookSelected: $appliedAudiobookSelected,
                                            showThisView: $showFilterView)
                            .presentationDetents([.height(250)])
                            .presentationDragIndicator(.visible)
                        }
                        
                        if appliedEbookSelected || appliedAudiobookSelected {
                            Button(action: {
                                appliedEbookSelected = false
                                appliedAudiobookSelected = false
                            }) {
                                Text("Clear all")
                                    .font(.caption)
                                    .foregroundColor(appliedEbookSelected || appliedAudiobookSelected ? .primary : .secondary)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
 
                    BookListItemView(bookFilter: getFilterList())
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
    
    private func getFilterText() -> String {
        if appliedEbookSelected && appliedAudiobookSelected {
            return "Ebooks, Audiobooks"
        } else if appliedEbookSelected {
            return "Ebooks"
        } else if appliedAudiobookSelected {
            return "Audiobooks"
        } else {
            return "Formats"
        }
    }
    
    private func getFilterList() -> BookListFilter {
        if appliedEbookSelected && appliedAudiobookSelected {
            return .none
        } else if appliedEbookSelected {
            return .eBook
        } else if appliedAudiobookSelected {
            return .audioBook
        } else {
            return .none
        }
    }
}
