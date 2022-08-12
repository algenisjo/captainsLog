//
//  AddNewNoteView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

struct AddNewNoteView: View {
    
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
                        notes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if notes.isEmpty {
                            dismiss()
                        } else {
                            let note = Note(context: moc)
                            note.id = UUID()
                            note.entry = notes
                            note.date = date
                            note.dateOne = Date.now
                            
                            try? moc.save()
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle(date)
            .toolbar {
                Button("Dismiss"){
                    dismiss()
                }
            }
            .colorScheme(.dark)
        }
        
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
            .previewInterfaceOrientation(.portrait)
    }
}

