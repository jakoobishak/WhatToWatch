//
//  WhatToWatchApp.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import SwiftUI

@main
struct WhatToWatchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
