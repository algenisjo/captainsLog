//
//  SettingsView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("userName") var userName = ""
    //@Environment(\.presentationMode) var presentationMode
    
    //@AppStorage("colorScheme") var preferredColorScheme: ColorScheme? = nil
    
    var body: some View {
        NavigationView{
            Form{
                Section("Tap below to change username"){
                    TextField("Change Username.", text: $userName)
                }
                
//                Section("Light or Dark Mode?"){
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
                           // presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            
        }
     //   .preferredColorScheme(preferredColorScheme)
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
