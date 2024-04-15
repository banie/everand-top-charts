//
//  CheckboxToggleStyle.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-14.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(configuration.isOn ? .primary : .secondary)
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}

extension Toggle {
    func checkboxToggle() -> some View {
        toggleStyle(CheckboxToggleStyle())
    }
}
