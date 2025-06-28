//
//  PluginActionButton.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

struct PluginActionButton: View {
    @Environment(AppModel.self) private var appModel
    var plugin: Plugin
    
    var body: some View {
        let installStatus = appModel.installStatus(plugin: plugin)
        
        HStack {
            if (installStatus == .installing) {
                ProgressView(value: appModel.progress(plugin: plugin))
                    .frame(maxWidth: 100)

            } else {
                Button(installStatus.buttonTitle) {
                    switch(installStatus.action) {
                    case .install:
                        appModel.installPlugin(plugin: plugin)
                    case .update:
                        appModel.updatePlugin(plugin: plugin)
                    case .installing:
                        break
                    case .alreadyInstalled:
                        break
                        
                    }
                }
                .disabled(installStatus.action == .alreadyInstalled)
                .transition(.blurReplace)
            }
            Button("Placeholder") {}
                .disabled(true)
                .allowsHitTesting(false)
                .opacity(0)
                .frame(width: 0.1)
        }
        .animation(.spring, value: installStatus)

    }
}

#Preview {
    PluginActionButton(plugin: .examples.randomElement()!)
        .environment(AppModel.preview)
}
