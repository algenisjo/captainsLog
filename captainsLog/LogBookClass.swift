//
//  LogBookClass.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

class LogBook: ObservableObject {
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
