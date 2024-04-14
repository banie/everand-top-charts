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
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(maxWidth: 30, maxHeight: 3)
                .foregroundColor(.secondary)
                .padding(.top, 4)
            
            HStack {
                Text("Formats")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    showThisView = false
                }) {
                    Image(systemName: "x.circle.fill")
                        .tint(.secondary)
                }
            }
            .padding(.horizontal, 25)
            
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
            .padding(.top, 1)
            .padding(.bottom, 5)

            Toggle("Ebooks", isOn: $isEbookSelected)
                .checkboxToggle()
                .padding(.horizontal, 25)
                .padding(.vertical, 5)

            Toggle("Audiobooks", isOn: $isAudiobookSelected)
                .checkboxToggle()
                .padding(.horizontal, 25)
                .padding(.vertical, 5)

            Button(action: {
                appliedEbookSelected = isEbookSelected
                appliedAudiobookSelected = isAudiobookSelected
                showThisView = false
            }) {
                Text("Apply")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            .padding(.horizontal, 23)
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .onAppear() {
            isEbookSelected = appliedEbookSelected
            isAudiobookSelected = appliedAudiobookSelected
        }
    }
}
