//
//   DisplayModeSetting.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/10/22.
//

import SwiftUI

struct _DisplayModeSetting: View {

    enum DisplayMode: Int {
        case system, dark, light
        
        var colorScheme: ColorScheme? {
            switch self {
            case .system: return nil
            case .dark: return ColorScheme.dark
            case .light: return ColorScheme.light
            }
        }
        
        func setAppDisplayMode() {
            var userInterfaceStyle: UIUserInterfaceStyle
            switch self {
            case .system: userInterfaceStyle = UITraitCollection.current.userInterfaceStyle
            case .dark: userInterfaceStyle = .dark
            case .light: userInterfaceStyle = .light
            }
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            scene?.keyWindow?.overrideUserInterfaceStyle = userInterfaceStyle
        }
    }
    
    @AppStorage("displayMode") var displayMode = DisplayMode.system
    
    var body: some View {
        HStack {
            Text("Display mode:")
            Picker("Is Dark?", selection: $displayMode) {
                Text("System").tag(DisplayMode.system)
                Text("Dark").tag(DisplayMode.dark)
                Text("Light").tag(DisplayMode.light)
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: displayMode) { newValue in
                print(displayMode)
                displayMode.setAppDisplayMode()
            }
        }
    }
}

struct _DisplayModeSetting_Previews: PreviewProvider {
    static var previews: some View {
        _DisplayModeSetting()
    }
}
