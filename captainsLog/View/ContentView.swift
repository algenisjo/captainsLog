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
    
    //Core Data -------------------------------------------------------------
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var note: FetchedResults<Note>
    //Core Data -------------------------------------------------------------
    
    var body: some View {
        NavigationView {
//            VStack{
//                List{
//                    ForEach(myLogBook.logBookNotes.reversed()){ item in
//                        Section(item.date){
//                            VStack(alignment: .leading){
//                                Text("\(item.note)")
//                                HStack{
//                                    Spacer()
//                                }
//                            }
//                        }
//
//                    }
//                    .onDelete { offsets in
//                        let reversed = Array(myLogBook.logBookNotes.reversed())
//                        let items = Set(offsets.map { reversed[$0].id })
//                        myLogBook.logBookNotes.removeAll { items.contains($0.id) }
//                    }
//                    //                HStack{
//                    //                    Spacer()
//                    //                Button("Test Data") {
//                    //                    let note = Note(context: moc)
//                    //                    note.id = UUID()
//                    //                    note.note = "This is a core data note."
//                    //                    note.date = "d"
//                    //
//                    //                    try? moc.save()
//                    //
//                    //                }
//                    //                }
//                }
//                Section("testing data"){
                    List(note) {item in
                        VStack{
                            HStack{
                                Text(item.date ?? "Date 1")
                                Spacer()
                            }
                            Text(item.entry ?? "Unknown")
                        }
//                    }
//                }
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
            //            .sheet(isPresented: $showSettings){
            //                SettingsView()
            //            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

