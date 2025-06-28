//
//  FruitVegetableEmoji.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//


import SwiftUI

enum FruitVegetableEmoji: String, CaseIterable {
    
    case blank = ""

    case apple = "🍎"
    case greenApple = "🍏"
    case pear = "🍐"
    case tangerine = "🍊"
    case lemon = "🍋"
    case banana = "🍌"
    case watermelon = "🍉"
    case grapes = "🍇"
    case strawberry = "🍓"
    case melon = "🍈"
    case cherry = "🍒"
    case peach = "🍑"
    case pineapple = "🍍"
    case mango = "🥭"
    case coconut = "🥥"
    case kiwi = "🥝"
    case avocado = "🥑"
    case tomato = "🍅"
    
    case eggplant = "🍆"
    case carrot = "🥕"
    case earOfCorn = "🌽"
    case hotPepper = "🌶️"
    case potato = "🥔"
    case cucumber = "🥒"
    case broccoli = "🥦"
    case leafyGreen = "🥬"
    case garlic = "🧄"
    case onion = "🧅"
    case mushroom = "🍄"
    case chestnut = "🌰"
    
    case blueberry = "🫐"
    
    case herb = "🌿"
        
    var color: Color {
        switch self {
        case .apple, .cherry, .strawberry, .peach, .tomato:
            return .red
        case .greenApple, .pear, .avocado, .cucumber, .leafyGreen, .broccoli, .herb, .kiwi:
            return .green
        case .tangerine, .lemon, .banana, .pineapple, .mango, .carrot, .earOfCorn:
            return .yellow
        case .watermelon, .melon:
            return .pink
        case .grapes, .eggplant, .blueberry:
            return .purple
        case .coconut, .potato, .garlic, .onion, .mushroom, .chestnut:
            return .brown
        case .hotPepper:
            return .orange
        case .blank:
            return .gray
        }
    }
    
    var name: String {
        String(describing: self).capitalized
    }
}

