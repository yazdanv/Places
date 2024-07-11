//
//  PlacesListItemView.swift
//  Places
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import SwiftUI

struct PlacesListItemView: View {
    
    let viewModel: PlacesListItemViewModel
    
    var body: some View {
        Button(action: viewModel.clickOnLocation) {
            PlacesListItemContentView(viewModel: viewModel)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.random, Color.random]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .overlay {
                    Color.black.opacity(0.2)
                }
                .cornerRadius(10)
                .shadow(radius: 5)
        )
        
        .padding([.horizontal, .top])
    }
}

private struct PlacesListItemContentView: View {
        
        let viewModel: PlacesListItemViewModel
        
        var body: some View {
            HStack {
                PlacesListItemTextView(viewModel: viewModel)
                Spacer()
                Image(systemName: Icons.locationInfo.rawValue)
                    .foregroundColor(.white)
            }
        }
    
}

private struct PlacesListItemTextView: View {
    
    let viewModel: PlacesListItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.location.name ?? Labels.defaultLocationName.rawValue)
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 2, x: 0, y: 0) // Shiny text effect
            Text("\(Labels.lat.rawValue) \(viewModel.location.lat) \(Labels.long.rawValue) \(viewModel.location.long)")
                .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 2, x: 0, y: 0) // Shiny text effect
        }
    }
    
}

#Preview {
    PlacesListItemView(viewModel: PlacesListItemViewModel(location: Location(name: "Test", lat: 0, long: 0)))
}
