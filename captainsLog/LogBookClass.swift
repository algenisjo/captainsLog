//
//  LogBookClass.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

class LogBookClass: ObservableObject{
    
    @Published var logBookNotes = [note](){
        //  everytime my array changes (didset) these changes (whatever functionality i place inside the function) will be saved
        didSet {
            //  lets save the data using json encoder below
            if let encoded = try? JSONEncoder().encode(logBookNotes){
                UserDefaults.standard.set(encoded, forKey: "LogBookNotes")
                //  save this instance under the key "LogBookNotes"
            }
        }
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

