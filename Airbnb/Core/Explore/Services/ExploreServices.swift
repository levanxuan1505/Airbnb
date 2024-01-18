//
//  ExploreServices.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import Foundation

class ExploreServices {
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
