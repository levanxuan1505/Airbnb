//
//  ExploreViewModals.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreServices
    private var listingsCopy = [Listing]()
    
    init(service: ExploreServices) {
        self.service = service
        Task { await fetchListings()}
    }
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("Debug: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    func updateListForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
