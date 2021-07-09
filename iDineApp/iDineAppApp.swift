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
    //will automatically gain access to environment object, and when any view changes it, all other places automatically update.
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
