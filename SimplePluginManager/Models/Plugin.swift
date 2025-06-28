//
//  Plugin.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

struct Plugin: Identifiable, Equatable, Hashable, Codable{
    let id: String
    let name: String
    let latestVersion: Int
    
    var versionString: String {
        let major = latestVersion / 1_000_000
        let minor = (latestVersion % 1_000_000) / 1_000
        let patch = latestVersion % 1_000
        return ("\(major).\(minor).\(patch)")
    }
    
    var details: String {
        let placeholder =
        """
        The {pluginName} module handles all your basic trimming tools with ease, while {pluginName} peels back complex edits for a smooth workflow. With {pluginName}, you can apply vibrant color corrections in just one click. {pluginName} ensures timeline syncing stays sweet and on schedule. For audio enhancements, {pluginName} brings richness and depth to every track. Add dynamic transitions using {pluginName}, and let {pluginName} automate repetitive tasks effortlessly. Need real-time previews? {pluginName} serves them fresh. When it's time to export, {pluginName} compresses without losing flavor, and {pluginName} helps with version control. Finally, {pluginName} ties everything together with intuitive drag-and-drop magic.

        """

        return placeholder.replacingOccurrences(of: "{pluginName}", with: name)
    }
}

extension Plugin {
    static var examples: [Plugin] {
        return [
            Plugin(id: "apple", name: "Apple", latestVersion: 1_001_002),
            Plugin(id: "banana", name: "Banana", latestVersion: 2_001_008),
            Plugin(id: "carrot", name: "Carrot", latestVersion: 2_001_010),
            Plugin(id: "tangerine", name: "Tangerine", latestVersion: 1_001_000),
            Plugin(id: "kiwi", name: "Kiwi", latestVersion: 1_001_003),
            Plugin(id: "eggplant", name: "Eggplant", latestVersion: 1_001_003),
            Plugin(id: "pineapple", name: "Pineapple", latestVersion: 2_001_001),
        ]
    }
}
