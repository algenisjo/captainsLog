//
//  captainsLogApp.swift
//  captainsLog
//
//  Created by Algenis on 6/28/22.
//

import SwiftUI

@main

struct captainsLogApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            // this is the live version of the data.
        }
    }
}
