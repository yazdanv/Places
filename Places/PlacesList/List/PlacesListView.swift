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
        if viewModel.isLoading {
            PlacesListLoadingView()
        } else if viewModel.error != nil {
            PlacesListErrorView(viewModel: viewModel)
        } else {
            PlacesListContentView(viewModel: viewModel)
        }
        
        
    }
}

// TODO: Make the loading view a view modifier to make it reusable
private struct PlacesListLoadingView: View {
    
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGFloat = -100
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(Color.blue, lineWidth: 8)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: rotation))
                    .scaleEffect(scale)
                    .offset(y: offset)
                
                Text("Loading...")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
            }
            .onAppear() {
                applyAnimations()
            }
        }
    }
    
    func applyAnimations() {
        withAnimation(
            Animation.easeInOut(duration: 0.8)
                .repeatForever(autoreverses: true)
        ) {
            self.isAnimating = true
        }
        withAnimation(
            Animation.easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true)
        ) {
            self.scale = 1.2
        }
        withAnimation(
            Animation.easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true)
                .delay(0.5)
        ) {
            self.offset = 20
        }
        withAnimation(
            Animation.linear(duration: 1)
                .repeatForever(autoreverses: false)
        ) {
            self.rotation = 360
        }
    }
    
}

private struct PlacesListErrorView: View {
    
    @ObservedObject var viewModel: PlacesListViewModel
    @State private var isAnimatingError = false
    @State private var isAnimatingButton = false
    
    var body: some View {
        VStack(spacing: Sizes.errorViewSpacing) {
            Text("\(Labels.error.rawValue) \(viewModel.error?.localizedDescription ?? Labels.unknownError.rawValue)")
                .foregroundColor(.red)
                .font(.headline)
                .multilineTextAlignment(.center)
                .cornerRadius(Sizes.buttonCornerRadius)
                .shadow(radius: Sizes.shadowRadius)
                .rotationEffect(.degrees(isAnimatingError ? 2 : -2))
                .animation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: isAnimatingError)
                .onAppear {
                    isAnimatingError = true
                }
            
            Button(action: {
                viewModel.fetchLocations()
                applyAnimations()
            }) {
                Text(Labels.retry.rawValue)
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(Sizes.buttonCornerRadius)
                    .shadow(radius: Sizes.shadowRadius)
                    .scaleEffect(isAnimatingButton ? 1.2 : 1.0)
            }
        }
        .padding()
        .cornerRadius(Sizes.errorViewCornerRadius)
        .shadow(radius: Sizes.errorViewShadowRadius)
    }
    
    private func applyAnimations() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isAnimatingButton.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimatingButton.toggle()
            }
        }
    }
}

private struct PlacesListContentView: View {
    
    @ObservedObject var viewModel: PlacesListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.itemViewModels, id: \.location.id) { item in
                        PlacesListItemView(viewModel: item)
                    }
                }
            }
            .navigationTitle(Labels.title.rawValue)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    PlacesListView(viewModel: PlacesListViewModel())
}
