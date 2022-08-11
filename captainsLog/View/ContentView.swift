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
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.entry, order: .reverse)
    ]) var note: FetchedResults<Note>
    //Core Data -------------------------------------------------------------
    
    var body: some View {
        NavigationView {
            //            VStack{
            //                List(note){ item in
            //                        Section(item.date){
            //                            VStack(alignment: .leading){
            //                                Text("\(item.entry)")
            //                                HStack{
            //                                    Spacer()
            //                                }
            //                            }
            //                        }
            //                    }
            //                    .onDelete { offsets in
            //                        let reversed = Array(myLogBook.logBookNotes.reversed())
            //                        let items = Set(offsets.map { reversed[$0].id })
            //                        myLogBook.logBookNotes.removeAll { items.contains($0.id) }
            //                    }
            //                }
            List(note) {item in
                Section(item.date ?? "Date 1"){
                        Text(item.entry ?? "Unknown")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

