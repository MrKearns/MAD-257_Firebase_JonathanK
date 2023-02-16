//
//  MAD_257_Firebase_JonathanKApp.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import SwiftUI
import Firebase

@main
struct MAD_257_Firebase_JonathanKApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
