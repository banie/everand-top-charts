//
//  FilterBooksView.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI

struct FilterBooksView: View {
    @Binding<Bool> var appliedEbookSelected: Bool
    @Binding<Bool> var appliedAudiobookSelected: Bool
    @Binding<Bool> var showThisView: Bool
    
    @State private var isEbookSelected: Bool = false
    @State private var isAudiobookSelected: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("Formats")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    showThisView = false
                }) {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(maxWidth: 18, maxHeight: 18)
                        .tint(.primary)
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
            Button(action: {
                isEbookSelected = false
                isAudiobookSelected = false
            }) {
                Text("Clear all")
                    .font(.caption)
                    .foregroundColor(isEbookSelected || isAudiobookSelected ? .primary : .secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
            .padding(.vertical, 1)
            .padding(.bottom, 5)

            Toggle("Ebooks", isOn: $isEbookSelected)
                .checkboxToggle()
                .padding(.horizontal, 25)
                .padding(.vertical, 5)

            Toggle("Audiobooks", isOn: $isAudiobookSelected)
                .checkboxToggle()
                .padding(.horizontal, 25)
                .padding(.vertical, 5)

            Button("Apply") {
                appliedEbookSelected = isEbookSelected
                appliedAudiobookSelected = isAudiobookSelected
                showThisView = false
            }
            .filledButton()
            .padding(.vertical)
            .padding(.horizontal, 23)
        }
        .onAppear() {
            isEbookSelected = appliedEbookSelected
            isAudiobookSelected = appliedAudiobookSelected
        }
    }
}
