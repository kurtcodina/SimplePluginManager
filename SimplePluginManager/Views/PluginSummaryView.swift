//
//  PluginSummaryView.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

struct PluginSummaryView: View {
    @Environment(AppModel.self) private var appModel
        
    var plugin: Plugin
    
    var body: some View {
        NavigationLink {
            Group {
                PluginDetailsView(plugin: plugin)
            }
        } label: {
            
            
            HStack {
                HStack {
                    ZStack {
                        PluginIconView(plugin: plugin)
                    }
                    VStack(alignment: .leading) {
                        Text(plugin.name)
                            .font(.title)
                        Text("Version \(plugin.versionString)")
                        PluginActionButton(plugin: plugin)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                
                
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(plugin.emoji.color.opacity(0.1))
            )
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PluginSummaryView(plugin: .examples.randomElement()!)
        .environment(AppModel.preview)
}
