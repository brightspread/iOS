//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Leo on 2023/07/06.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    let persistenceContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
