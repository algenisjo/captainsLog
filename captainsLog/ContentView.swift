//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI



struct ContentView: View {
    //-----------------------
    var date = Date.now.formatted(.dateTime.day().month().year())
    @State private var textInput = " "
    //-----------------------
    var body: some View {
        NavigationView{
            Form{
                TextField("Type here.", text: $textInput)
                    .navigationTitle(date)
                    //.navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(content: {
                            Button("Submit") {
                                //more code to come
                                
                            }
                        })
                    }
            }
        }
    }
    //-----------------------
    
    // this is a test.
    //-----------------------
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
