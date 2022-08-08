//
//  AddNewNoteView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

struct AddNewNoteView: View {
    
    @ObservedObject var myLogBook = LogBookClass()
    @Environment(\.dismiss) var dismiss
    @State private var notes = ""
    
    @State private var date = Date.now.formatted(.dateTime.day().month().year())
    
    var body: some View {
        
        NavigationView{
            VStack{
                TextField("Type Here!", text: $notes)
                Spacer()
            }
            .padding()
            .navigationTitle(date) 
                .toolbar{
                    Button("Save"){
                        let newNote = note(note: notes, date: date)
                        myLogBook.logBookNotes.append(newNote)
                        dismiss()
                    }
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
    }
}
