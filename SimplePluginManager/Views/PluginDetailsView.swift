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
    
    
    func installedVersionString() -> String {
        guard let installedVersion = appModel.installedVersionString(plugin: plugin) else { return "" }
        
        let major = installedVersion / 1_000_000
        let minor = (installedVersion % 1_000_000) / 1_000
        let patch = installedVersion % 1_000
        
        return ("\(major).\(minor).\(patch)")
    }
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
                PluginIconView(plugin: plugin)
  
                Text(plugin.name)
                    .font(.title)
                Text("Version \(plugin.versionString)")
                    .font(.caption)
            if !installedVersionString().isEmpty {
                Text("Installed: v\(installedVersionString())")
                    .font(.caption)
                    .foregroundStyle(plugin.latestVersion > (appModel.installedVersionString(plugin: plugin) ?? 0) ? .red : .green)
            }
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
