//
//  ForgotPassword.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    @State private var emailID: String=""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading,spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName:"arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top,10)
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,5)
            Text("Please enter your email ID so we can send the reset link")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack(spacing:25) {
                CustomTF(sfIcon: "at", hint: "EmailID", value: $emailID)
            
                GradientButton(title: "Send link", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty)
            }
            .padding(.top,20)
            
         
        })
        .padding(.vertical,15)
        .padding(.horizontal,25)
        .interactiveDismissDisabled()
    }
}


#Preview {
    AuthenticationView()
}
