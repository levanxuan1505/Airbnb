//
//  ProfileView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Text("Log in to start planning your next trip")
                            .foregroundStyle(.foreground)
                    }
                    .padding(.bottom,10)
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
                    HStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                        Text("Airbnb your place")
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("It's simple to get set up and start earning.")
                                .font(.caption)
                                .foregroundStyle(.foreground)
                                
                        }
                        Spacer()
                        VStack() {
                            Image(systemName:"building.columns")
                                .resizable()
                                .frame(width: 50, height: 45)
                        }
                    
                
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    .frame(width: 360, height:  150)
                  
                   
                    HStack() {
                        Text("Don't have an account?")
                        
                        Button(action: {
                                       }) {
                                           NavigationLink(destination: SignUpView()) {
                                               Text("Sign up")
                                                   .underline()
                                                   .fontWeight(.bold)
                                                  
                                      
                                      }
                                
                        }

                    }
                    .font(.caption)
                    
                }
                VStack(spacing:24) {
                    ProfileOptionRowView(imageName: "gear", title: "Settings")
                    ProfileOptionRowView(imageName: "pencil.and.outline", title: "Accessiblity")
                    ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
