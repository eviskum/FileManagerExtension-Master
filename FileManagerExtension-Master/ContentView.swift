//
//  ContentView.swift
//  FileManagerExtension-Master
//
//  Created by Esben Viskum on 25/05/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var people: People
    
    var body: some View {
        VStack {
            Text("Antal i peopleList:  \(people.peopleList.count)")
                .padding()
            
            Button(action: {
                people.loadExamples()
            }, label: {
                Text("Load examples")
            })

            Button(action: {
                people.saveToDisk()
            }, label: {
                Text("Save to disk")
            })

            Button(action: {
                people.loadFromDisk()
            }, label: {
                Text("Load from disk")
            })

            Button(action: {
                people.deleteFile()
            }, label: {
                Text("Delete file on disk")
            })

            Button(action: {
                people.checkFileExists()
            }, label: {
                Text("Check if file exists")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
