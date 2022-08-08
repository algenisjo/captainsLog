//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var myLogBook = LogBook()
    var date = Date.now.formatted(.dateTime.day().month().year())
    @State private var textInput = ""
    @State private var AddNewNoteViewIsPresented = false
    
    var body: some View {
        NavigationView{
            List{
                
                ForEach(myLogBook.logBookNotes){ item in
                    Section(date){
                        VStack(alignment: .leading){
                            Text("\(item.note)")
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Captain's Log")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button("New Note"){
                        AddNewNoteViewIsPresented = true
                    }
                }
            }
            .sheet(isPresented: $AddNewNoteViewIsPresented){
                AddNewNoteView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/// - Done.------------------ save the items with user defaults
/// resort  array so that newest item is at the top of the list.
/// make items in the list deletable.
/// -  - Done.------------- create a second page to view the list of items. keep the first page for just journaling
/// - create a way to add images
/// - change the header to be my username Captain Algenis
/// - allow for locking the app behind a passcode or face id
/// - use mvvm to organize files
/// - allow for different wallpapers to be used
/// - create the macbook pro version of this app
///
