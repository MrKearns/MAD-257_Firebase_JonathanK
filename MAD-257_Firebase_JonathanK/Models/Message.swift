//
//  Message.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
