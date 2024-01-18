//
//  MainTabView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(){
            ExploreView()
                .tabItem { Label("Explore", systemImage:"magnifyingglass")}
            WishlistsView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            TripsView()
                .tabItem { Label("Trips", systemImage: "figure.skiing.downhill") }
            InboxView()
                .tabItem { Label("Inbox", systemImage: "square.and.pencil") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
               
        }
       
        .accentColor(.pink)
        .edgesIgnoringSafeArea(.top) // Ignore the safe area to cover the status bar
        .statusBar(hidden: true) // Hide the status bar
//        .hidden() // Hide the tab bar
    }
}

#Preview {
    MainTabView()
}
