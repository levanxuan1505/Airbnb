//
//  ListingItemCarouselView.swift
//  Airbnb
//
//  Created by admin on 01/01/2024.
//

import SwiftUI

struct ListingItemCarouselView: View {
    let listing : Listing
    
    var body: some View {
            TabView {
                ForEach(listing.imageURLs, id:\.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(.page)
        }
}

#Preview {
    ListingItemCarouselView(listing: DeveloperPreview.shared.listings[0])
}
