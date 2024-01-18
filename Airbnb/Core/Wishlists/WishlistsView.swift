//
//  WishlistsView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI

struct WishlistsView: View {
  
    func onSubmit() {
     
     }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("Wishlists")
                            .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                        Text("Log in to view your wishlists.")
                            .fontWeight(.semibold)
                        Text("You can create, view or edit wishlists once you're logged in")
                            .font(.footnote)
                    }
                    .padding(.horizontal)
                    
    //                    Button {
    //                     
    //                    } label: {
    //                        Text("Log in")
    //                            .foregroundStyle(.white)
    //                            .font(.subheadline)
    //                            .fontWeight(.semibold)
    //                            .frame(width: 360, height: 48)
    //                            .background(.pink)
    //                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button(action: {
                                   }) {
                                       NavigationLink(destination: SignInView()) {
                                           Text("Log in")
                                               .foregroundStyle(.white)
                                               .font(.subheadline)
                                               .frame(width: 360, height: 48)
                                               .fontWeight(.semibold)
                                               .background(.pink)
                                               .clipShape(RoundedRectangle(cornerRadius: 8))
                                               
                                        }
                            
                                   }
                                   .hSpacing()

                    Spacer()
                }
                .navigationTitle("Wishlists")
                .navigationBarHidden(true)
                .padding()
            }
            
        }

    }
}

#Preview {
    WishlistsView()
}
