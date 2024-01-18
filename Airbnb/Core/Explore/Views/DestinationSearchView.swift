//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by admin on 02/01/2024.
//

import SwiftUI
enum DestinationSearchOptions {
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption  : DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    func onSubmit() {
        viewModel.updateListForLocation()
        show.toggle()
     }
    var body: some View {
        VStack() {
            Spacer()
            HStack() {
                
                Button {
                        withAnimation(.snappy) {
                            viewModel.updateListForLocation()
                            show.toggle()
                        }
                        
                  } label: {
                      Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
               }
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
               
            }
            .padding()
//            Where  to?
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                    HStack() {
                        Image(systemName:"magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .onSubmit {
                                viewModel.updateListForLocation()
                                show.toggle()
                            } 
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth:  1.0)
                            .foregroundColor(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where",description: "Add destination")
                }
             
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .frame(height: selectedOption == .location ? 145 :64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
//            When
            VStack(alignment: .leading) {
                if(selectedOption == .dates) {
//                   expand
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From",selection: $startDate, displayedComponents: .date)
                           
                        Divider()
                        DatePicker("To",selection: $endDate, displayedComponents: .date)
                            
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                }
                else {
                    CollapsedPickerView(title: "When",description: "Add dates")
                       
                    }
                    
                }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .frame(height: selectedOption == .dates ? 180 :64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }

    //Who
            VStack(alignment: .leading,spacing: 20) {
                if selectedOption == .guests {
//                    expand
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement:{
                       numGuests += 1
                   } onDecrement: {
                       guard numGuests > 0 else {return}
                       numGuests -= 1
                    }
                    
                    Stepper {
                        Text("\(numGuests) Children")
                    } onIncrement:{
                       numGuests += 1
                   } onDecrement: {
                       guard numGuests > 0 else {return}
                       numGuests -= 1
                    }
                    
                    Stepper {
                        Text("\(numGuests) Infants")
                    } onIncrement:{
                       numGuests += 1
                   } onDecrement: {
                       guard numGuests > 0 else {return}
                       numGuests -= 1
                    }
                    
                    Stepper {
                        Text("\(numGuests) Pets")
                    } onIncrement:{
                       numGuests += 1
                   } onDecrement: {
                       guard numGuests > 0 else {return}
                       numGuests -= 1
                    }


                    
                } else {
                    
                
                CollapsedPickerView(title: "Who",description: "Add guests")
                       
                        }
               }
            
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .frame(height: selectedOption == .guests ? 280 :64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            

           Spacer()
           Spacer()
        Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .overlay(alignment: .bottom) {
            VStack(){
                Divider()
                    .padding(.bottom)
                HStack() {
                    Button() {
                        
                    } label : {
                        Text("Clear all")
                            .underline()
                            
                    }
                    .foregroundStyle(.black)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width:75, height: 32)
                   
                    Spacer()
                    Button {
                        onSubmit()
                    } label : {
                        Image(systemName:"magnifyingglass")
                        Text("Search")
                            
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width:150, height: 50)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal,32)
            }
            .background(.white)
        }
         
        
    }
}

#Preview {
    DestinationSearchView(show : .constant(false),viewModel: ExploreViewModel(service: ExploreServices()))
}


// Can't using shadow like this
struct CollapsibleDestinnationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
struct CollapsedPickerView: View {
    let title: String
    let description : String
    
    var body: some View {
        VStack() {
            HStack() {
                Text(title)
                    .foregroundStyle(.black)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }

    }
}

#Preview {
    ExploreView()
}
