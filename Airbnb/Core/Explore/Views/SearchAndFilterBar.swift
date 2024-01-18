//
//  SearchAndFilterBar.swift
//  Airbnb
//
//  Created by admin on 01/01/2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    @Binding var show: Bool
    var body: some View {
        HStack() {
            HStack {
                Image(systemName: "magnifyingglass")
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(location.isEmpty ? "Where to?" : location)
                        .font(.footnote)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("\(location.isEmpty ? "AnyWhere - " : "") Any week - Add guests")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical,10)
            .overlay(
                Capsule()
                    .stroke(lineWidth: 1.5)
                    .foregroundStyle(Color(.systemGray))
                    .shadow(color: .white.opacity(0.4), radius: 1)
                )
            Spacer()
            
            VStack {
                Button(action: {
                    withAnimation(.smooth) {
                        show.toggle()
                    }
                } ,label: {
                    Image(systemName:"slider.horizontal.3")
                        .foregroundStyle(.black)
                })
               
            }
            .padding(15)
            .overlay(
                       Circle()
                        .stroke(lineWidth: 1.5)
                        .foregroundStyle(Color(.systemGray))
                        .shadow(color: .white.opacity(0.4), radius: 1)

                       )
           
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ExploreView()
}
