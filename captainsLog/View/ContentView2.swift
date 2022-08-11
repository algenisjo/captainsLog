//
//  ContentView2.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/11/22.
//

import SwiftUI

struct ContentView2: View {
    
    //Core Data -------------------------------------------------------------
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var note: FetchedResults<Note>
    //Core Data -------------------------------------------------------------
    //
    var body: some View {
        VStack{
            List(note) {item in
                VStack{
                    HStack{
                        Text(item.date ?? "Date")
                        Spacer()
                    }
                    Text(item.entry ?? "Unknown")
                }
            }
            
            Button("Test Data") {
                let note = Note(context: moc)
                note.id = UUID()
                note.entry = "This is a core data note."
                note.date = "d"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
