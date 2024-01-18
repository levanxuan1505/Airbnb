//
//  AuthenticationView.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct AuthenticationView: View {
    @State public var showSignup: Bool = false
    @State public var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack{
            LogInView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                    if !showSignup {
                        isKeyboardShowing = false
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                    isKeyboardShowing = false
                })
        }
        .toolbar(.hidden, for: .tabBar)
        .overlay {
            if #available(iOS 17, *){
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0),value: showSignup)
                    .animation(.smooth(duration: 0.45, extraBounce: 0),value: isKeyboardShowing)
            } else {
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardShowing)
            }
        }
    }
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.pink, .white, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 12)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    AuthenticationView()
}
