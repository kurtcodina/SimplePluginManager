//
//  SimplePluginManagerApp.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

@main
struct SimplePluginManagerApp: App {
    
    @State private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
    }
}
