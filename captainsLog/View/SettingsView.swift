//
//  SettingsView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("userName") var userName = ""
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView{
            Form{
                Section("Tap below to change username"){
                    TextField("Change Username.", text: $userName)
                }
                .toolbar{
                    ToolbarItem() {
                        Button("Dismiss") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            
            .navigationTitle("Settings")
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
