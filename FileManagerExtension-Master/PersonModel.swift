//
//  PersonModel.swift
//  FileManagerExtension-SPM
//
//  Created by Esben Viskum on 24/05/2021.
//

import Foundation
import FileManagerExtension

class Person: Identifiable, Codable {
    var id: UUID
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
    }
}

class People: ObservableObject {
    @Published var peopleList: [Person] = []
    
    init() {
        
    }
    
    func addPerson(firstName: String, lastName: String) {
        peopleList.append(Person(firstName: firstName, lastName: lastName))
//        saveToDisk()
    }
    
    func reset() {
        peopleList = []
//        saveToDisk()
    }
    
    func loadExamples() {
        peopleList.append(Person(firstName: "Anders", lastName: "And"))
        peopleList.append(Person(firstName: "Andersine", lastName: "And"))
        peopleList.append(Person(firstName: "Onkel", lastName: "Joakim"))
 //       saveToDisk()
    }
    
    func loadFromDisk() {
        FileManager.default.readJSON([Person].self, docName: "PeopleList2", completion: { (result) in
            switch result {
            case .success(let data):
                print("loadFromDisk: Data loaded successfully")
                peopleList = data
            case .failure(let error):
                print("loadFromDisk: Unable to load data")
                print(error.localizedDescription)
            }
        })
        
    }
    
    func saveToDisk() {
        FileManager.default.saveJSON(data: peopleList, docName: "PeopleList2", completion: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
    func deleteFile() {
        FileManager.default.deleteDocument(docName: "PeopleList2", completion: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
    func checkFileExists() {
        if FileManager.default.docExists(named: "PeopleList2") {
            print("File exists")
        } else {
            print("File does not exist")
        }
    }
}
