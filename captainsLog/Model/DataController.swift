//
//  DataController.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/11/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // prepares core data to load this data
    let container = NSPersistentContainer(name: "noteData")
    
    // to load the data above
    init(){
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
// make an instince of data controller and send it to content view to be used
    // look inside swiftui main
    // then we put it into the swiftui environment.
        // look under content view in the swift main app
}
