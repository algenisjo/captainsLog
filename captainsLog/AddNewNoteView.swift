//
//  AddNewNoteView.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct AddNewNoteView: View {
    
    @ObservedObject var myLogBook = LogBookClass()
    @Environment(\.dismiss) var dismiss
    
    @State private var notes = ""
    @State private var date = Date.now.formatted(.dateTime.day().month().year())
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        NavigationView{
            VStack{
                image?
                    .resizable()
                    .scaledToFit()
                
                Form{
                    Text("Type below.")
                    TextEditor(text: $notes)
                }
                
                HStack{
                    Spacer()
                    Button("Add Image") {
                        showingImagePicker = true
                    }
                    Spacer()
                    Button("Save Note"){
                        let newNote = note(note: notes, date: date)
                        myLogBook.logBookNotes.append(newNote)
                        dismiss()
                    }
                    Spacer()
                }
            }
            .navigationTitle(date)
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
            .previewInterfaceOrientation(.portrait)
    }
}

