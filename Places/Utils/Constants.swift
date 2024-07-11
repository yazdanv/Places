//
//  Constants.swift
//  Places
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation

enum Constants: String {
    case wikipediaUrlFormat = "wikipedia://location?lat=%f&lon=%f"
}

enum Labels: String {
    case title = "Places"
    case userLocation = "User Location"
    case didNotFindYourLocation = "Did not find your location? open it here"
    case defaultLocationName = "No Name"
    case long = "Longitude:"
    case lat = "Latitude:"
    case unknownError = "Unknown Error"
    case error = "Error:"
    case retry = "Retry"
    
    case enterLocation = "Enter Location Coordinates"
    case openInWikipedia = "Open in Wikipedia"
}

enum Icons: String {
    case locationInfo = "info.circle"
}

struct Sizes {
    static let buttonCornerRadius: CGFloat = 10
    static let shadowRadius: CGFloat = 10
    static let errorViewCornerRadius: CGFloat = 20
    static let errorViewShadowRadius: CGFloat = 20
    static let errorViewSpacing: CGFloat = 20
}
