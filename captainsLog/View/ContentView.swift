//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var myLogBook = LogBookClass()
    @State private var textInput = ""
    
    @State private var AddNewNoteViewIsPresented = false
    @State private var showSettings = false
    
    @AppStorage("userName") var userName = "Captain's Log"
    
    var body: some View {
        NavigationView {
            List{
                ForEach(myLogBook.logBookNotes.reversed()){ item in
                    Section(item.date){
                        VStack(alignment: .leading){
                            Text("\(item.note)")
                            HStack{
                                Spacer()
                            }
                        }
                    }
                    
                }
                .onDelete { offsets in
                    let reversed = Array(myLogBook.logBookNotes.reversed())
                    let items = Set(offsets.map { reversed[$0].id })
                    myLogBook.logBookNotes.removeAll { items.contains($0.id) }
                }
            }
            .navigationTitle(userName)
            .toolbar{
                    Button("New Note") {
                        AddNewNoteViewIsPresented = true
                }
            }
            .sheet(isPresented: $AddNewNoteViewIsPresented){
                AddNewNoteView()
            }
            .sheet(isPresented: $showSettings){
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

