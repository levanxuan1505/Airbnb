//
//  SignUpView.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var emailID: String=""
    @State private var password: String=""
    @State private var confirmPassword: String=""
    @State private var fullName: String=""
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 15, content: {
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName:"arrow.left")
                    .font(.title2)
                    .foregroundStyle(.pink)
            })
            .padding(.top,10)
            Text("Sign up")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,25)
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack(spacing:25) {
                CustomTF(sfIcon: "at", hint: "EmailID", value: $emailID)
                
                CustomTF(sfIcon: "person", hint: "FullName", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true , value: $password)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password", isPassword: true , value: $confirmPassword)
                    .padding(.top, 5)
                
            
                GradientButton(title: "Confirm", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || fullName.isEmpty || password.isEmpty)
            }
            .padding(.top,20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing:6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Button("Log in") {
                    dismiss()
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
        .overlay {
            if #available(iOS 17, *){
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0),value: isKeyboardShowing)
            } else {
                CircleView()
                   
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardShowing)
            }
        }
    }
    
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.pink, .white, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 300, height: 300)
            .offset(x: 90, y: -50 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 12)
            .hSpacing(.trailing)
            .vSpacing(.top)
    }
}
#Preview {
    ContentView()
}
