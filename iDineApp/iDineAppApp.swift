//
//  iDineAppApp.swift
//  iDineApp
//
//  Created by Sam Greenhill on 7/7/21.
//

import SwiftUI

@main
struct iDineAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
