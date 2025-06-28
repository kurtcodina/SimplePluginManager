//
//  PluginDetailsView.swift
//  SimplePluginManager
//
//  Created by codina on 6/29/25.
//


import SwiftUI

struct PluginDetailsView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.dismiss) var dismiss
    
    var plugin: Plugin
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
                PluginIconView(plugin: plugin)
  
                Text(plugin.name)
                    .font(.title)
                Text("Version \(plugin.versionString)")
                    .font(.caption)
                PluginActionButton(plugin: plugin)
            Text(plugin.details)
                .font(.body)
                .frame(maxWidth: 400)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(plugin.emoji.color.opacity(0.1))
        )
        .navigationTitle(plugin.name)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", systemImage: "chevron.left")
                }
            }
        }
    }

}

#Preview {
    PluginDetailsView(plugin: .examples.randomElement()!)
        .environment(AppModel.preview)
}
