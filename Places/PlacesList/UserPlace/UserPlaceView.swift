//
//  UserPlaceView.swift
//  Places
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import SwiftUI

struct UserPlaceView: View {
    
    @ObservedObject var viewModel: UserPlaceViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Labels.enterLocation.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .transition(.scale)
                .padding()
            
            TextField(Labels.lat.rawValue, text: $viewModel.lat)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                        .shadow(color: .gray, radius: 3, x: 0, y: 3)
                )
                .padding(.horizontal, 40)
            
            TextField(Labels.long.rawValue, text: $viewModel.long)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                        .shadow(color: .gray, radius: 3, x: 0, y: 3)
                )
                .padding(.horizontal, 40)
            
            Button(action: {
                viewModel.openLocation()
            }) {
                Text(Labels.openInWikipedia.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}


#Preview {
    UserPlaceView(viewModel: UserPlaceViewModel())
}
