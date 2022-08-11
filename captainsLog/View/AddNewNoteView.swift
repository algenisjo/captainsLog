//
//  AddNewNoteView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

struct AddNewNoteView: View {
    
//    @ObservedObject var myLogBook = LogBookClass()
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var notes = ""
    @State private var date = String( Date.now.formatted(.dateTime.day().month().year()) )
    
    var body: some View {
        NavigationView{
                Form{
                    ZStack(alignment: .leading) {
                        if notes.isEmpty {
                            Text("  Type Here.")
                                .opacity(notes.isEmpty ? 0.25 : 1)
                        }
                        TextEditor(text: $notes)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack{
                        Spacer()
                        Button("Upload.") {
                            let note = Note(context: moc)
                            note.entry = notes
                            note.date = date
                            
                            try? moc.save()
                            dismiss()
                        }
                        
//                        Spacer()
//                        Button("Upload."){
//                            let newNote = note(note: notes, date: date)
//                            myLogBook.logBookNotes.append(newNote)
//                            dismiss()
//                        }
                    }
                }
            .navigationTitle(date)
            .toolbar {
                Button("Dismiss"){
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
            .previewInterfaceOrientation(.portrait)
//            .preferredColorScheme(.dark)
    }
}

