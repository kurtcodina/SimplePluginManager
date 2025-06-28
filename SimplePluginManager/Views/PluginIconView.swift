//
//  PluginIconView.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

struct PluginIconView: View {
    let plugin: Plugin
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(plugin.emoji.color.gradient.opacity(0.4))
            .frame(width: 80, height: 80)
            .overlay(
                Text(plugin.emoji.rawValue)
                    .font(.system(size: 50))
            )
    }
}

#Preview {
    PluginIconView(plugin: .examples.randomElement()!)
}
