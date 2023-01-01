//
//  DetailsScreen.swift
//  EcommerceApp
//
//  Created by MacBOOK Pro on 28/12/22.
//

import SwiftUI

struct DetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                //Color("background")
            
                ScrollView {
                    Image("shirt1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    DescriptionView()
                        
                }
                .edgesIgnoringSafeArea(.top)
                
                VStack {
                    HStack {
                        Text("Add to Cart")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        HStack(spacing: 2) {
                            Text("$")
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .padding(.top, 5)
                            
                            Text("99")
                                .font(.title2)
                                .foregroundColor(Color.white)
                        }
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color("primary"))
                    .cornerRadius(20)
                }
                
                .padding(.horizontal, 40)
                .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}),
            trailing: Image("heart")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color("background"))
                .cornerRadius(8.0))
        
            .padding(.all, 8)
            .background(Color.white)
            .cornerRadius(8.0)
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundColor(Color("primary"))
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color("background"))
                .cornerRadius(8.0)
        })
    }
}

struct ColorDotsView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())    }
}

struct DescriptionView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Casual Shirt")
                //.padding(.top)
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4) {
                ForEach(0..<5) {item in
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Text("(5.0)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
                
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    })
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner1(radius: 9).stroke())
                    .foregroundColor(Color("primary"))
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 9)
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                            .background(Color("primary"))
                            .cornerRadius(10)
                    })
                }
            }
            Text("Description")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
                .lineSpacing(8)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("Length: 130cm")
                        .opacity(0.6)
                    
                    Text("Shoulder Width: 90cm")
                        .opacity(0.6)
                    
                    Text("Sleeve Length: 82cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotsView(color: Color.blue)
                        ColorDotsView(color: Color.black)
                        ColorDotsView(color: Color.red)
                        ColorDotsView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical)
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius1(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30)
    }
}


struct RoundedCorner1: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius1(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

