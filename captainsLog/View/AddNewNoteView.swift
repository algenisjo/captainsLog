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
            VStack{
                    ZStack(alignment: .leading) {
                                   TextEditor(text: $notes)
                                       .padding()
                                   if notes.isEmpty {
                                       VStack{
                                           Text("  Type Here.")
                                               .opacity(notes.isEmpty ? 0.25 : 1)
                                               .padding()
                                               .padding(.top, 10)
                                           Spacer()
                                       }
                                   }
                               }
                               .padding()
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward.2")
                                .font(.title3)
                        }
                        
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
                    .padding()
                            .navigationBarHidden(true)
                Spacer()
            } // end of vstack
        } // end of view
//    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
    }
}

