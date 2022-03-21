//
//  ListData.swift
//  ToDoList
//
//  Created by Kevin biecker on 3/14/22.
//

import Foundation

struct Inputs: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

class ListData: ObservableObject {
    @Published var items: [Inputs] = []

    enum FileError: Error {
      case loadFailure
      case saveFailure
      case urlFailure
    }

    init(withChecking: Bool) throws {
        do {
            try load()
            } catch {
                throw error
            }
    }
    
    init() {}
    
    func addToList(title: String){
        items.append(
            Inputs(title: title, isCompleted: false)
        )
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getURL() -> URL? {
        guard let documentsURL = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentsURL.appendingPathComponent("listdata.plist")
    }
    
    func update(isCompleted: Bool) throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        
    }
    
    func save() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        let plistData = items.map {
            [$0.id.uuidString, $0.title, $0.isCompleted]
        }
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
        
            try data.write(to: dataURL, options: .atomic)
        } catch {
        
            throw FileError.saveFailure
        }
    }
    
    func load() throws {
      
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        do {
            let data = try Data(contentsOf: dataURL)
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
        
            let convertedPlistData = plistData as? [[Any]] ?? []
            items = convertedPlistData.map {
                Inputs(
                    title: $0[1] as? String ?? String(),
                    isCompleted: $0[2] as? Bool ?? Bool()
                )}
        } catch {
            throw FileError.loadFailure
        }
    }
    
}
