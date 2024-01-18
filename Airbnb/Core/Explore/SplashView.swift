//
//  SplashView.swift
//  Airbnb
//
//  Created by admin on 04/01/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack() {
                VStack () {
                    Image("airbnb")
                        .resizable()
                        .frame(width: 120, height: 120)
                       
                    Text("Airbnb")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.pink.opacity(0.89))
                        .padding(5)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear(){
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now()+1.6) {
                    withAnimation(.smooth){
                        self.isActive = true
                    }
                    
                }
            }
        }
   
    }
}

#Preview {
    SplashView()
}
