//
//  Plugin+Emoji.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

extension Plugin {
    var emoji: FruitVegetableEmoji {
        if let matchedCase = FruitVegetableEmoji.allCases.first(where: {
            $0.name.lowercased() == id.lowercased()
        }) {
            return matchedCase
        } else {
            return .blank
        }
    }
}
