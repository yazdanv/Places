//
//  PlacesApp.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import SwiftUI
import SwiftData

@main
struct PlacesApp: App {
    var body: some Scene {
        WindowGroup {
            PlacesListView(viewModel: PlacesListViewModel())
        }
    }
}
