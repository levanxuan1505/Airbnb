//
//  GradientButton.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing:15 ) {
                Text(title)
                Image(systemName: icon)
            }
        })
        .fontWeight(.bold)
        .foregroundStyle(.white)
        .padding(.vertical,12)
        .padding(.horizontal,35)
        .background(.linearGradient(colors:[.pink, .pink, .purple], startPoint: .top, endPoint: .bottom),in:.capsule)
    }
}

