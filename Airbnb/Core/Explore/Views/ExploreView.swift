//
//  ExploreView.swift
//  Airbnb
//
//  Created by admin on 01/01/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showFiltersView = false
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreServices())
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView,
                viewModel: viewModel)
            } else {
                VStack {
                    SearchAndFilterBar(location: $viewModel.searchLocation, show: $showFiltersView)
                        .onTapGesture{
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                
                    ScrollView {
                       
                        LazyVStack(spacing: 32) {
                            ForEach(viewModel.listings) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height: 460)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                    .navigationDestination(for: Listing.self) { listing in
                        ListingDetailView(listing: listing)
                            .navigationBarBackButtonHidden()
                   }
                }
                .sheet(isPresented: $showFiltersView, content: {
                    if #available(iOS 16.4, *) {
                        /// Since I wanted a Custon Sheet Corner Radius
                        FiltersView(showFiltersView: $showFiltersView)
                            .presentationDetents([.height(950)])
                            .presentationCornerRadius(30)
                    } else {
                        FiltersView(showFiltersView: $showFiltersView)
                            .presentationDetents([.height(950)])
                            
                    }
                })
                
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ExploreView()
}
