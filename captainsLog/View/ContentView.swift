//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var myLogBook = LogBookClass()
//    @State private var textInput = ""
    
    @State private var AddNewNoteViewIsPresented = false
//    @State private var showSettings = false
    
//    @AppStorage("userName") var userName = "Captain's Log"
    
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
            List{
                ForEach(note) { item in
                    Section(item.date ?? "Date 1"){
                            Text(item.entry ?? "Unknown")
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Captain's Log")
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
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let note = note[offset]

            // delete it from the context
            moc.delete(note)
        }

        // save the context
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

