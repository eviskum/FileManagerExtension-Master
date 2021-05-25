//
//  FileManagerExtension_MasterApp.swift
//  FileManagerExtension-Master
//
//  Created by Esben Viskum on 25/05/2021.
//

import SwiftUI

@main
struct FileManagerExtension_MasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(People())
        }
    }
}
