//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Sean Veal on 2/22/24.
//

import SwiftUI
import WidgetKit

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    WidgetCenter.shared.reloadAllTimelines()
                })
        }
        .modelContainer(for: [Transaction.self])
    }
}
