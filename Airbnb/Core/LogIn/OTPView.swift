//
//  OTPView.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
   
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
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,5)
            Text("An 6 digit code has been sent to your Email ID.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack(spacing:25) {
            
                GradientButton(title: "Send link", icon: "arrow.right") {
                  
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.isEmpty)
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
