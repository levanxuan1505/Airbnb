//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by admin on 01/01/2024.
//

import SwiftUI
import MapKit
struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var heart = false
    @State private var cameraPosition: MapCameraPosition
    var formattedDouble: String {
          let soLuongChuSoSauDauPhay = 2
        return String(format: "%.\(soLuongChuSoSauDauPhay)f", listing.rating)
      }
    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .losAngeles: listing.city=="Miami" ? .miami :
            listing.city == "NewYork City" ? .newYork :
            listing.city == "Columbus" ? .columbus :
            listing.city == "Chicago" ? .chicago :
            listing.city == "Houston" ? .houston :
            listing.city == "Austin" ? .austin :
            listing.city=="Boston" ? .boston :
            listing.city == "Ha Long" ? .halong :
            listing.city == "Sapa" ? .sapa :
            listing.city == "Trang An" ? .trangan :
            listing.city == "Dong Da" ? .hanoi :
            listing.city == "Hoi An" ? .hoian :
            listing.city == "Phu Quoc" ? .phuquoc :
            listing.city == "Washington" ? .washington : .denver,
            span:
            MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue:  .region(region))
    }
    var body: some View {
        NavigationView  {
            ScrollView {
                ZStack(alignment: .topLeading) {
                    ListingItemCarouselView(listing: listing)
                        .frame(height:320)
                    HStack() {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward")
                                .foregroundStyle(.black)
                                .background{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 32, height: 32)
                                }
                                .padding(.top, 62)
                                .padding(.leading, 32)
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundStyle(.black)
                                    .background{
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 32, height: 32)
                                    }
                                    .padding(.top, 62)
                                
                                
                                
                            }
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
                                    .padding(.top, 62)
                                    .padding(.horizontal,32)
                                
                            }
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
                
                VStack(alignment: .leading, spacing:8) {
                    Text("\(listing.title)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 360,alignment: .leading)
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                            Text("\(formattedDouble)")
                            Text(" - ")
                            Text("28 reviews")
                                .underline()
                                .fontWeight(.semibold)
                            
                            
                        }
                        .foregroundStyle(.black)
                        Text("\(listing.city) \(listing.state)")
                        
                    }
                    
                    .font(.caption)
                    
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                //              Host details
                HStack () {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                            .font(.headline)
                            .frame(width: 250,alignment: .leading)
                        HStack() {
                            Text("\(listing.numberOfGuests) guests")
                            Text("-")
                            Text("\(listing.numberOfBedrooms) bedrooms")
                            Text("-")
                            Text("\(listing.numberOfBeds) beds")
                            Text("-")
                            Text("\(listing.numberOfBathrooms) baths")
                            
                        }
                        .font(.caption)
                        
                    }
                    .frame(width: 300, alignment: .leading)
                    Spacer()
                    Image("\(listing.ownerImageUrl)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                }
                .padding()
                
                Divider()
                VStack(spacing:16) {
                    ForEach(listing.features) { feature in
                        HStack(spacing: 12){
                            Image(systemName: feature.imageName)
                            VStack(alignment: .leading){
                                Text(feature.title)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                Text(feature.subtitle)
                                    .foregroundStyle(.gray)
                                    .font(.footnote)
                                
                                
                            }
                            Spacer()
                        }
                    }
                    
                }
                .padding()
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1 ..< listing.numberOfBedrooms, id: \.self) { bedroom in
                                VStack {
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(bedroom)")
                                }
                                .frame(width:132,height: 100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.5)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(2)
                        
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    ForEach(listing.amenities) { amenitie in
                        HStack(){
                            Image(systemName: amenitie.imageName)
                            Text(amenitie.title)
                                .font(.footnote)
                            Spacer()
                        }
                        
                    }
                    
                }
                .padding()
                Divider()
                
                VStack(alignment: .leading, spacing: 16){
                    HStack {
                        Text("Where you'll be")
                            .font(.headline)
                        Spacer()
                    }
                    Map(position: $cameraPosition)
                        .frame(height:200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
                .padding(.bottom,20)
            }
            .scrollIndicators(.hidden)
            .toolbar(.hidden, for: .tabBar)
            .ignoresSafeArea()
            .padding(.bottom, 64)
            .overlay(alignment: .bottom) {
                VStack(){
                    Divider()
                        .padding(.bottom)
                    HStack() {
                        VStack(alignment: .leading){
                            Text("$\(listing.pricePerNight)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Total before taxes")
                                .font(.subheadline)
                            Text("Oct 15 - 20")
                                .underline()
                                .fontWeight(.semibold)
                                .font(.footnote)
                        }
                        Spacer()
                        Button {
                            
                        } label : {
                            Text("Reserve")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width:150, height: 50)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal,32)
                }
                .background(.white)
            }
        }
        .gesture(
                   DragGesture().onEnded { gesture in
                       if gesture.translation.width > 50 {
                           // Vuốt từ mép trái sang phải nhiều hơn 50 điểm, quay về màn hình trước
                           withAnimation(.smooth) {
                               dismiss()
                           }
                       }
                   }
               )
       
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[3])
}
