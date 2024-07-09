//
//  PlacesListView.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import SwiftUI

struct PlacesListView: View {
    
    @ObservedObject var viewModel: PlacesListViewModel
    
    init(viewModel: PlacesListViewModel) {
        self.viewModel = viewModel
        self.viewModel.fetchLocations()
    }
    
    var body: some View {
        List(viewModel.locations, id: \.id) { item in
            Text(item.name ?? "Unknown")
        }
    }
}

#Preview {
    PlacesListView(viewModel: PlacesListViewModel())
}
