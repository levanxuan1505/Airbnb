//
//  ListingView.swift
//  Airbnb
//
//  Created by admin on 01/01/2024.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    @State private var heart = false
    var formattedDouble: String {
          let soLuongChuSoSauDauPhay = 2
        return String(format: "%.\(soLuongChuSoSauDauPhay)f", listing.rating)
      }
    var body: some View {
        VStack () {
            ZStack(alignment: .topLeading) {
                ListingItemCarouselView(listing: listing)
                    .frame(height: 365)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              
                    HStack() {
                        Spacer()
                        Button (
                            action:{
                                heart.toggle()
                            }
                        ) {
                            Image(systemName: "heart")
                                .foregroundStyle(heart ? .pink : .black)
                                .background{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 32, height: 32)
                                }
                                .padding(.top, 25)
                                .padding(.horizontal,22)
                          
                        }
                    
                }
            }
            
            HStack(alignment: .top) {
//                 details
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding(.vertical,10)
                    Text("12 mi, away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                Spacer()
//                rating start
             
                
                    HStack(){
                            Image(systemName: "star.fill")
                        Text("\(formattedDouble)")
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical,6)
                
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
