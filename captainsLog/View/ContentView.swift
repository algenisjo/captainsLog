//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.

// app icons is attributed below:
// <a href='https://www.freepik.com/vectors/cute-astronaut'>Cute astronaut vector created by catalyststuff - www.freepik.com</a>

import SwiftUI

struct ContentView: View {
    
    @State private var AddNewNoteViewIsPresented = false
    
    //Core Data -------------------------------------------------------------
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.dateOne, order: .reverse)
    ]) var note: FetchedResults<Note>
    //Core Data -------------------------------------------------------------
    
    var body: some View {
        NavigationView {
            List{
                ForEach(note){ item in
                    Section(item.date ?? "Date 1"){
                        Text(item.entry ?? "Unknown")
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .toolbar{
                NavigationLink(destination: AddNewNoteView(), isActive: $AddNewNoteViewIsPresented ) {
                    Button {
                        AddNewNoteViewIsPresented = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.body)
                    }
                }
            }
            .navigationTitle("Captain's Log")
            .navigationBarTitleDisplayMode(.inline)
        }
        .colorScheme(.dark)
    }
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            // find this note in our fetch request
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
