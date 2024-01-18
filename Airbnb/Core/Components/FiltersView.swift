//
//  ResetPassword.swift
//  Airbnb
//
//  Created by admin on 03/01/2024.
//

import SwiftUI

struct FiltersView: View {
    @State private var password: String=""
    @State private var confirmPassword: String=""
    @State private var isSwitchOnBook = false
    @State private var isSwitchOnSelf = false
    @State private var isSwitchOnPet = false
    @State private var isChecked: Bool = false
    @Binding var showFiltersView: Bool
    @State private var textInput: String = ""
    @State private var offset: CGFloat = 0
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, content: {
                ZStack {
                    Text("Filter")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .hSpacing()
                    
                    HStack() {
                        Button(action: {
                            
                            dismiss()
                        }, label: {
                            Image(systemName:"xmark")
                                .font(.title2)
                                .foregroundStyle(.black)
                            
                        })
                        Spacer()
                    }
                    
                    
                }
                Divider()
                ScrollView() {
                    VStack(alignment: .leading) {
                        Text("Type of place")
                            .font(.headline)
                            .padding(.top,5)
                        
                        Text("Search rooms, entire homes, or any type of place.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        HStack(spacing: 20) {
                            Button {
                                
                            } label : {
                                Text("Any type")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width:100, height: 45)
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            Button {
                                
                            } label : {
                                Text("Room")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width: 100, height: 45)
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            Button {
                                
                            } label : {
                                Text("Entire home")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width:100, height: 45)
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                        }
                        .hSpacing()
                        .padding(.bottom, 20)
                        .padding(.top, 5)
                        Divider()
                        
                        Text("Price range")
                            .font(.headline)
                            .padding(.top,5)
                        
                        Text("Nightly prices before fees and taxes")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        HStack() {
                            
                            TextField("$ Minimum", text: $textInput)
                                .padding()
                                .frame(width:160, height: 45)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                                .overlay (
                                    RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            Spacer()
                            TextField("$ Maximum", text: $textInput)
                                .padding()
                                .frame(width:160, height: 45)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay (
                                    RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        .padding(.horizontal,2)
                        
                        Divider()
                        Text("Rooms and beds")
                            .font(.headline)
                            .padding(.top,5)
                        
                        VStack(alignment: .leading){
                            
                            Text("Bedrooms")
                                .padding(.vertical, 8)
                            ScrollView(.horizontal) {
                                HStack(){
                                    Text("Any")
                                        .padding()
                                        .frame(width: 70, height: 32)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                    ForEach(1 ... 8, id:\.self) { item in
                                        Text("\(item)")
                                            .padding()
                                            .frame(width: 70, height: 32)
                                            .overlay (
                                                RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                    
                                }
                                .frame(height:33)
                                .padding(.horizontal,2)
                            }
                            
                            Text("Beds")
                                .padding(.vertical, 8)
                            ScrollView(.horizontal) {
                                HStack(){
                                    Text("Any")
                                        .padding()
                                        .frame(width: 70, height: 32)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                    ForEach(1 ... 8, id:\.self) { item in
                                        Text("\(item)")
                                            .padding()
                                            .frame(width: 70, height: 32)
                                            .overlay (
                                                RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                    
                                }
                                .frame(height:33)
                                .padding(.horizontal,2)
                            }
                            
                            Text("Bathrooms")
                                .padding(.vertical, 18)
                            ScrollView(.horizontal) {
                                HStack() {
                                    Text("Any")
                                        .padding()
                                        .frame(width: 70, height: 32)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                    ForEach(1 ... 8, id:\.self) { item in
                                        Text("\(item)")
                                            .padding()
                                            .frame(width: 70, height: 32)
                                            .overlay (
                                                RoundedRectangle(cornerRadius: 32) // Adjust corner radius as needed
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                    
                                }
                                .frame(height:33)
                                .padding(.horizontal,2)
                            }
                            
                        }
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        Text("Top-tier stays")
                            .font(.headline)
                            .padding(.top,5)
                        
                        HStack(alignment: .top){
                            // Room and Beds
                            VStack(alignment: .leading) {
                                Image(systemName: "figure.surfing")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .padding(.horizontal, 36)
                                Text("Guest favorites")
                                    .font(.title3)
                                    .padding(.bottom, 2)
                                Text("The most loved homes on Airbnb, according to guests")
                                    .font(.footnote)
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 130)
                            .overlay (
                                RoundedRectangle(cornerRadius: 16) // Adjust corner radius as needed
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                        .padding(.bottom, 20)
                        .padding(.horizontal, 2)
                        
                        Divider()
                        
                        Text("Property type")
                            .font(.headline)
                            .padding(.top,5)
                        
                        HStack(){
                            
                            VStack {
                                HStack {
                                    VStack(){
                                        Image(systemName:"house")
                                            .resizable()
                                            .frame(width: 36, height: 32)
                                            .padding(.horizontal, 36)
                                        Text("House")
                                            .font(.title3)
                                            .padding(.bottom, 2)
                                    }
                                    .frame(width: 160, height: 160)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    
                                    Spacer()
                                    VStack(){
                                        Image(systemName:"building")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .padding(.horizontal, 36)
                                        Text("Apartment")
                                            .font(.title3)
                                            .padding(.bottom, 2)
                                        
                                    }
                                    
                                    .frame(width: 160, height: 160)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    
                                }
                                .padding(.bottom, 14)
                                .padding(.horizontal, 2)
                                
                                HStack {
                                    VStack(){
                                        Image(systemName:"house.lodge")
                                            .resizable()
                                            .frame(width: 36, height: 32)
                                            .padding(.horizontal, 36)
                                        Text("Guesthouse")
                                            .font(.title3)
                                            .padding(.bottom, 2)
                                    }
                                    
                                    .frame(width: 160, height: 160)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    
                                    Spacer()
                                    VStack(){
                                        Image(systemName:"music.note.house")
                                            .resizable()
                                            .frame(width: 36, height: 32)
                                            .padding(.horizontal, 36)
                                        Text("Hotel")
                                            .font(.title3)
                                            .padding(.bottom, 2)
                                    }
                                    
                                    .frame(width: 160, height: 160)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    
                                }
                                .padding(.horizontal, 1)
                            }
                            
                        }
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        Text("Ameneties")
                            .font(.headline)
                            .padding(.top,5)
                        
                        VStack() {
                            HStack() {
                                Text("Wifi")
                                    .font(.callout)
                                Spacer()
                                Toggle(isOn: $isChecked) {
                                    
                                }
                            }
                            .padding(.horizontal,2)
                            HStack() {
                                Text("Kitchen")
                                    .font(.callout)
                                Spacer()
                                Toggle(isOn: $isChecked) {
                                    
                                }
                            }
                            .padding(.horizontal,2)
                            HStack() {
                                Text("Washer")
                                    .font(.callout)
                                Spacer()
                                Toggle(isOn: $isChecked) {
                                    
                                }
                            }
                            .padding(.horizontal,2)
                            HStack() {
                                Text("TV")
                                    .font(.callout)
                                Spacer()
                                Toggle(isOn: $isChecked) {
                                    
                                }
                            }
                            .padding(.horizontal,2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        Text("Booking options")
                            .font(.headline)
                            .padding(.top,5)
                        
                        VStack {
                            HStack(){
                                VStack(alignment: .leading) {
                                    Text("Instant Book")
                                        .font(.callout)
                                        .padding(.top,8)
                                    
                                    
                                    Text("Book without waiting for the host to respond")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                    
                                }
                                Spacer()
                                Toggle("", isOn: $isSwitchOnBook)
                                
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            
                            HStack(){
                                VStack(alignment: .leading) {
                                    Text("Self check-in")
                                        .font(.callout)
                                        .padding(.top,8)
                                    
                                    
                                    Text("Easy access to the property once you arrive")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                }
                                Spacer()
                                Toggle("", isOn: $isSwitchOnSelf)
                                
                                    .frame(width: 60)
                                
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            
                            
                            HStack(){
                                VStack(alignment: .leading) {
                                    Text("Allows pets")
                                        .font(.callout)
                                        .padding(.top,8)
                                    
                                    Text("Bringing a service animal?")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                }
                                Spacer()
                                
                                Toggle("", isOn: $isSwitchOnPet)
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        
                        Divider()
                        
                        Text("Accessibility features")
                            .font(.headline)
                            .padding(.top,5)
                        
                        HStack(){
                            // Room and Beds
                        }
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        Text("Host language")
                            .font(.headline)
                            .padding(.top,5)
                            .fontWeight(.semibold)
                        
                        VStack(){
                            HStack() {
                                Text("English")
                                    .font(.callout)
                                    .padding(.top,8)
                                
                                
                                Spacer()
                                
                                Toggle("", isOn: $isSwitchOnPet)
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            HStack() {
                                Text("French")
                                    .font(.callout)
                                    .padding(.top,8)
                                
                                
                                Spacer()
                                
                                Toggle("", isOn: $isSwitchOnPet)
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            HStack() {
                                Text("German")
                                    .font(.callout)
                                    .padding(.top,8)
                                
                                
                                Spacer()
                                
                                Toggle("", isOn: $isSwitchOnPet)
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 10)
                            HStack() {
                                Text("Chinese")
                                    .font(.callout)
                                    .padding(.top,8)
                                
                                
                                Spacer()
                                
                                Toggle("", isOn: $isSwitchOnPet)
                                    .frame(width: 60)
                                
                            }
                            .padding(.horizontal,2)
                            .padding(.bottom, 50)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
            })
            .offset(y: offset)
                       .gesture(
                           DragGesture()
                               .onChanged { value in
                                   offset = max(value.translation.height, 0)
                               }
                               .onEnded { value in
                                   withAnimation(.snappy) {
                                            if offset > geometry.size.height * 0.3 {
                                                    dismiss()
                                                    } else {
                                                    offset = 0
                                                    }
                                                         }
                               }
                       )
            .padding(.vertical,15)
            .padding(.horizontal,25)
            .interactiveDismissDisabled()
            .overlay(alignment: .bottom) {
                VStack(){
                    Divider()
                        .padding(.bottom)
                    HStack() {
                        VStack(alignment: .leading){
                            
                            Text("Clear all")
                                .underline()
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                        Spacer()
                        Button {
                            dismiss()
                        } label : {
                            Text("Show Places")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width:150, height: 50)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal,32)
                }
                .background(.white)
            }
        }
       
    }
}
#Preview {
    ContentView()
}

