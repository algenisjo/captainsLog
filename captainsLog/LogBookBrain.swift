//
//  LogBookBrain.swift
//  captainsLog
//
//  Created by Algenis Joaquin Ortiz on 8/8/22.
//

import SwiftUI

struct note: Identifiable, Codable {
    var id = UUID()
    //let date: String
    let note: String
    let date:  Date.FormatStyle.FormatOutput
//    let image: UIImage?
}
