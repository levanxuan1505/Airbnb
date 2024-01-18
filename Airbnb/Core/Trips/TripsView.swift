//
//  WishlistsView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 32) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Trips")
                            .font(.largeTitle)
                        .fontWeight(.semibold)
                        Text("No trips yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("When you're ready to plan your next trip, we're here to help.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Button(action: {
                                       }) {
                                           NavigationLink(destination: SignInView()) {
                                               Text("Log in")
                                                   .foregroundStyle(.white)
                                                   .font(.subheadline)
                                                   .frame(width: 162, height: 48)
                                                   .fontWeight(.semibold)
                                                   .background(.pink)
                                                   .clipShape(RoundedRectangle(cornerRadius: 8))
                                                   
                                      }
                                
                        }
                        HStack {
                            Text("Can't find your trips here?")
                                .font(.footnote)
                            Text("Visit the Help Center")
                                .underline()
                                .font(.footnote)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                    }
                    .navigationTitle("Trips")
                    .navigationBarHidden(true)
                    .padding()
                    
                }
            }
          
            
        }
    }
}
#Preview {
    TripsView()
}


