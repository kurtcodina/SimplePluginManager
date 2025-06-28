//
//  ContentView.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    
    var body: some View {
        NavigationSplitView {
            List {
                Button("Plugins"){
                    
                }
                .buttonStyle(.plain)
            }
        } detail: {
            ScrollView{
                VStack(alignment: .leading) {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){             ForEach(appModel.allPlugins.sorted(by: { $0.id < $1.id })){ plugin in
                        PluginSummaryView(plugin: plugin)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .transition(.opacity)
                            

                    }
                    }
                }
                .padding()
                .animation(.smooth(), value: appModel.allPlugins)
            }
            .navigationTitle("My Plugins")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        appModel.startSyncing()
                    }) {
                        Label(appModel.isSyncing ? "Syncing" : "Sync", systemImage: "arrow.triangle.2.circlepath")
                            .labelStyle(.titleAndIcon)
                            .animation(.interactiveSpring, value: appModel.isSyncing)
                    }
                    .disabled(appModel.isSyncing)
                    .symbolEffect(.rotate, isActive: appModel.isSyncing)
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
        .environment(AppModel.preview)
}
