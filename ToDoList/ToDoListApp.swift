//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kevin biecker on 3/14/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listData: ListData = ListData()
    
    init() {
      let listData: ListData
      do {
          listData = try ListData(withChecking: true)
      } catch {
        print("Could not load history data")
          listData = ListData()
      }
        _listData = StateObject(wrappedValue: listData)
    }

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listData)
            .onAppear {
              print(FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask))
            }
        }
    }
}
