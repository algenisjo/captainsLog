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
    
//    @State private var image: Image?
//    @State private var showingImagePicker = false
//    @State private var inputImage: UIImage?
    
    //    @State private var imageData: Data?
    
//    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
//            VStack{
//                image?
//                    .resizable()
//                    .scaledToFit()
                
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
                        Button("Upload."){
                            //                        image = Data(Image?)
                            let newNote = note(note: notes, date: date)
                            //                        let newNote = note(note: notes, date: date, image: imageData)
                            myLogBook.logBookNotes.append(newNote)
                            dismiss()
                        }
                    }
                }
//            }
            .navigationTitle(date)
//            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Dismiss"){
                    dismiss()
                }
            }

        }
//        .sheet(isPresented: $showingImagePicker) {
//            ImagePicker(image: $inputImage)
//        }
//        .onChange(of: inputImage) { _ in loadImage() }
    }
    
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
            .previewInterfaceOrientation(.portrait)
    }
}

