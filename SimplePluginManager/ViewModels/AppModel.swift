//
//  AppModel.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

@Observable class AppModel {
    private(set) var isSyncing: Bool = false
    
    private(set) var allPlugins = Plugin.examples
    private(set) var installedPlugins: [InstalledPlugin] = [
        InstalledPlugin(pluginID: "apple", installedVersion: 1_001_002, installedDate: .now),
        InstalledPlugin(pluginID: "banana", installedVersion: 2_001_008, installedDate: .now),
        InstalledPlugin(pluginID: "carrot", installedVersion: 1_001_001, installedDate: .now)
    ]
    private(set) var pluginInstallProgress: [String: Double] = [:]

    func installStatus(plugin: Plugin) -> PluginInstallStatus {
        if pluginInstallProgress.keys.contains(plugin.id) {
            return .installing
        }
        
        let installedVersion: Int? = installedPlugins.first(where: { $0.pluginID == plugin.id })?.installedVersion
        switch(installedVersion) {
        case nil:
            return .notInstalled
        case let installedVersion? where installedVersion < plugin.latestVersion:
            return .outdated
        default:
            return .installed
        }
    }
    
    func installedVersionString(plugin: Plugin) -> Int? {
        return installedPlugins.first(where: { $0.pluginID == plugin.id })?.installedVersion
    }
    
    func progress(plugin: Plugin) -> Double? {
        pluginInstallProgress[plugin.id]
    }
    
    func installPlugin(plugin: Plugin) {
        guard pluginInstallProgress[plugin.id] == nil else { return }
        Task {
            do {
                let installed = try await simulatePluginInstallation(plugin: plugin)
                installedPlugins.removeAll(where: { $0.pluginID == plugin.id})
                installedPlugins.append(installed)
            } catch {
                print("Installation failed: \(error)")
            }
            pluginInstallProgress.removeValue(forKey: plugin.id)
        }
    }
    
    func updatePlugin(plugin: Plugin) {
        installPlugin(plugin: plugin)
    }
    
    func startSyncing() {
        isSyncing = true
        Task {
            do {
                let result = try await loadPluginsFromFileSimulated()
                allPlugins = result
            } catch {
                print("Error loading plugins: \(error)")
            }
            isSyncing = false
        }
    }
    
    
    
    func loadPluginsFromFileSimulated(fileName: String = "updatedPlugins") async throws -> [Plugin] {
        try await Task.sleep(nanoseconds: 2_000_000_000)

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "FileNotFound", code: 404, userInfo: [NSLocalizedDescriptionKey: "plugins.json not found in bundle"])
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Plugin].self, from: data)
    }
    
    func simulatePluginInstallation(plugin: Plugin) async throws -> InstalledPlugin {
        pluginInstallProgress[plugin.id] = 0

        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        pluginInstallProgress[plugin.id] = 0.5
        
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        pluginInstallProgress[plugin.id] = 1.0
        
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        let newPlugin = InstalledPlugin(
            pluginID: plugin.id,
            installedVersion: plugin.latestVersion,
            installedDate: .now
        )
        return newPlugin
    }
    
    static var preview: AppModel {
        .init()
    }
}
