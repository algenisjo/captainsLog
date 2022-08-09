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
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                    ZStack {
                        Color.green
                        Rectangle()
                            .fill(.secondary)
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    .padding()
                   // Button("Save", action: save)
                
                .padding([.horizontal, .bottom])
                .onChange(of: inputImage) { _ in loadImage() }
                Form{
                    Text("Type here please.")
                TextEditor(text: $notes)
                }
                HStack{
                    Spacer()
                Button("Save Note"){
                    let newNote = note(note: notes, date: date)
                    myLogBook.logBookNotes.append(newNote)
                    dismiss()
                }
                .padding()
                }
            }
            .navigationTitle(date)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    //
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        // applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    //
    
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNoteView()
    }
}

