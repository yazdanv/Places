//
//  UserPlaceViewModel.swift
//  Places
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Combine

final class UserPlaceViewModel: ObservableObject {
    
    @Published var lat: String = ""
    @Published var long: String = ""
    
    let urlOpenHandler: UrlOpenHandler
    
    init(urlOpenHandler: any UrlOpenHandler = DefaultUrlOpenHandler()) {
        self.urlOpenHandler = urlOpenHandler
    }
    
    func openLocation() {
        guard let lat = Double(self.lat), let long = Double(self.long) else { return }
        urlOpenHandler.openWikipediaLocation(lat: lat, long: long)
    }
    
}
