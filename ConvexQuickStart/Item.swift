//
//  Item.swift
//  ConvexQuickStart
//
//  Created by BURN Mfg on 22/08/2025.
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
