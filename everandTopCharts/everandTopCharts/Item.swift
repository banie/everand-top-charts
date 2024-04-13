//
//  Item.swift
//  everandTopCharts
//
//  Created by banie setijoso on 2024-04-12.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
