//
//  SettingsView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("userName") var userName = ""
    @Environment(\.dismiss) var dismiss
    
    //@State var preferredColorScheme: ColorScheme? = nil
//    @State private var showGreeting = true
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationView{
            Form{
                Section("username"){
                    TextField("Change Username.", text: $userName)
                }
                
//                Section("Appearance"){
//
////                    Text(colorScheme == .dark ? "Dark" : "Light")
//
//                    List {
//                        Button(action: { preferredColorScheme = .light }) {
//                            HStack {
//                                Text("Light")
//                                Spacer()
//                                if preferredColorScheme == .light {
//                                    selectedImage
//                                }
//                            }
//                        }
//
////                        Toggle("Dark", isOn: $showGreeting)
//
//                        Button(action: { preferredColorScheme = .dark }) {
//                            HStack {
//                                Text("Dark")
//                                Spacer()
//                                if preferredColorScheme == .dark {
//                                    selectedImage
//                                }
//                            }
//                        }
//                    }
//                }
                .toolbar{
                    ToolbarItem() {
                        Button("Exit") {
                            dismiss()
                        }
                    }
                } 
            }
            .navigationTitle("Settings")
            
        }
        //.preferredColorScheme(preferredColorScheme)
    }
    
//    var selectedImage: some View {
//        Image(systemName: "checkmark")
//            .foregroundColor(.blue)
//    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

