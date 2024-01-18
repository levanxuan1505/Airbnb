//
//  LogInView.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct LogInView: View {
    @Binding var showSignup: Bool
    @State private var emailID: String=""
    @State private var password: String=""
    @State private var showForgotPasswordView: Bool = false
    // Reset Password View(with New password and confirmration Password View )
    @State private var showResetView: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 15, content: {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Button(action: {
            }, label: {
                Image(systemName:"arrow.left")
                    .font(.title2)
                    .foregroundStyle(.pink)
            })
            .padding(.top,5)
            Text("Log in")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.pink)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack(spacing:25) {
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true , value: $password)
                    .padding(.top, 5)
                Button ("Forgot Password"){
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.pink)
                .hSpacing(.trailing)
                GradientButton(title: "Log in", icon: "arrow.right") {
                     
                } 
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
            }
            .padding(.top,20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing:6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                Button("Sign up") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.pink)
            }
            .font(.callout)
            .hSpacing()
        })
        .toolbar(.hidden, for: .tabBar)
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .toolbar(.hidden,for: .navigationBar)
        /// Asking I wanted a Custom Sheet Corner Radius
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *) {
                /// Since I wanted a Custon Sheet Corner Radius
                ForgotPassword(showResetView:  $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView:  $showResetView)
                    .presentationDetents([.height(300)])
                    
            }
        })
        /// Asking
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                /// Since I wanted a Custon Sheet Corner Radius
               ResetPassword(showResetView: $showResetView)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                ResetPassword(showResetView: $showResetView)
                    .presentationDetents([.height(350)])
                    
            }
        })

    }
}

