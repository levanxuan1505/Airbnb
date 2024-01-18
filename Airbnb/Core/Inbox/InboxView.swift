//
//  WishlistsView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 12) {
                        HStack {
                            Text("Inbox")
                                .font(.largeTitle)
                            .fontWeight(.semibold)
                        Spacer()
                        }
                    
                        Image(systemName:"mail.and.text.magnifyingglass")
                            .resizable()
                            .frame(width: 58, height: 50)
                        Text("No new messages")
                            .fontWeight(.semibold)
                        
                        Text("When you contact a Host or send a reservation request, you'll see your messages here.")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    
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
                .navigationTitle("Inbox")
                .navigationBarHidden(true)
                .padding()
            }
        }
       
    }
}

#Preview {
    InboxView()
}

