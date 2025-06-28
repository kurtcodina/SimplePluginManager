//
//  PluginInstallStatus.swift
//  SimplePluginManager
//
//  Created by codina on 6/27/25.
//

enum PluginInstallStatus {
    case notInstalled
    case outdated
    case installing
    case installed
    
    enum Action {
        case install
        case update
        case installing
        case alreadyInstalled
    }
    
    var action: Action {
        switch self {
        case .notInstalled:
            return .install
        case .outdated:
            return .update
        case .installing:
            return .installing
        case .installed:
            return .alreadyInstalled
        }
    }

    var buttonTitle: String {
        switch action {
        case .install:
            return "Install"
        case .update:
            return "Update"
        case .installing:
            return "Installing"
        case .alreadyInstalled:
            return "Installed"
        }
    }
}
