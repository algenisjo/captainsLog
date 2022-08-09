//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var myLogBook = LogBookClass()
    var date = Date.now.formatted(.dateTime.day().month().year())
    @State private var textInput = ""
    @State private var AddNewNoteViewIsPresented = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(myLogBook.logBookNotes.reversed()){ item in
                    Section(date){
                        VStack(alignment: .leading){
                            Text("\(item.note)")
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }
                .onDelete { offsets in
                    let reversed = Array(myLogBook.logBookNotes.reversed()) //get the reversed array -- use Array() so we don't get a ReversedCollection
                    let items = Set(offsets.map { reversed[$0].id }) //get the IDs to delete
                    myLogBook.logBookNotes.removeAll { items.contains($0.id) } //remove the items with IDs that match the Set
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

// allow users to upload photos
//change the header to be my username Captain Algenis
//allow for locking the app behind a passcode or face id
//create the macbook pro version of this app

