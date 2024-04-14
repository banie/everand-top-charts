//
//  ButtonStyle.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI

struct BorderedCapsuledStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal)
            .overlay(
                Capsule()
                    .stroke(.secondary, lineWidth: 1)
            )
            .font(.body)
            .contentShape(Capsule())
    }
}

struct FilledCornerRadiusStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(.systemBackground))
            .padding()
            .frame(maxWidth: .infinity)
            .background(.primary)
            .cornerRadius(10)
    }
}

extension Button {
    func borderedCapsuledButton() -> some View {
        buttonStyle(BorderedCapsuledStyle())
    }
    
    func filledButton() -> some View {
        buttonStyle(FilledCornerRadiusStyle())
    }
}
