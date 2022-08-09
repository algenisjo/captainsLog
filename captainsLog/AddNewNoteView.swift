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
            Form{
                TextEditor(text: $notes)
            }
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
//
//VStack{
//Form {
//    TextEditor(text: $notes)
////                    .lineLimit(5)
////                Spacer()
////                Form {
//        //                                 Spacer(minLength: 8)
//        TextEditor(text: $notes)
//        //                                     .padding(.all, 1.0)
////                        .padding(10)
//        //                         .background(Color(.sRGB, red: 0.9, green: 0.9, blue: 0.9, opacity: 0.9))
////                        .cornerRadius(20)
////                }
//
//}
////            .padding()
