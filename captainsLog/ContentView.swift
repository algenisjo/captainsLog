//
//  ContentView.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

struct note: Identifiable, Codable {
    var id = UUID()
    let date: String
    let note: String
}


class logBook: ObservableObject {
    @Published var logBookNotes = [note](){
        didSet {
            //lets save the data using json encoder below
            if let encoded = try? JSONEncoder().encode(logBookNotes){
                //save an instance of this variable habit
                UserDefaults.standard.set(encoded, forKey: "LogBookNotes")
                //save this instance under the key "Habit"
            }
        }//everytime my array changes (didset) these changes (whatever functionality i place inside the function) will be saved
    }
    
    // to load the data we saved above when the app relaunches we
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "LogBookNotes"){
            if let decodedItems = try? JSONDecoder().decode([note].self, from: savedItems){
                logBookNotes = decodedItems
                return
            }
        }
        
        logBookNotes  = []
    }
}

struct ContentView: View {
    
    @StateObject var myLogBook = logBook()
    var date = Date.now.formatted(.dateTime.day().month().year())
    @State private var textInput = ""
    
    var body: some View {
        NavigationView{
            List{
                Section("Type below."){
                    VStack{
                        TextEditor(text: $textInput)
                        HStack{
                            Spacer()
                        }
                    }
                }
                
                ForEach(myLogBook.logBookNotes){ item in
                    Section(date){
                        VStack(alignment: .leading){
                            Text("\(item.note)")
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Captain's Log")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button("Save"){
                        let newNote = note(date: date, note: textInput)
                        myLogBook.logBookNotes.append(newNote)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/// - save the items with user defaults
/// - create a second page to view the list of items. keep the first page for just journaling
/// - create a way to add images
/// - change the header to be my username Captain Algenis
/// - allow for locking the app behind a passcode or face id
/// - use mvvm to organize files
/// - allow for different wallpapers to be used
/// - create the macbook pro version of this app
///
