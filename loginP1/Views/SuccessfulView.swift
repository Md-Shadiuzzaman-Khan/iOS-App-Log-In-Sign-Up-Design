//
//  SuccessfulView.swift
//  loginP1
//
//  Created by MacBOOK Pro on 25/12/22.
//

import SwiftUI

struct SuccessfulView: View {
    
    @State private var selectedIndex: Int = 0
    
    private let categories = ["All", "Casual", "Gucci", "Adidas", "Nike", "Yellow", "Denim"]
    
    @State private var search: String = ""
    
    @State var gridLayout = [GridItem(.adaptive(minimum: 100)), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Color("background").ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            topBarView()
                            SloganView().padding()
                            SearchView(search: $search)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {
                                            selectedIndex = i
                                        }, label: {
                                            CategoriesView(isActive: selectedIndex == i, text: categories[i])
                                        })
                                    }
                                }
                                .padding()
                            }
                            
                            Text("Trending")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(0 ..< 4) { i in
                                        ProductView(image: Image("shirt\(i+1)"), size: 130)
                                    }
                                    .padding(.leading)
                                }
                            }
                            .padding(.bottom)
                            
                            Text("Popular")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            ScrollView {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20) {
                                    ForEach(0 ..< 4) { i in
                                        ProductView(image: Image("shirt\(i+1)"), size: geometry.size.width / 2 - 60)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .navigationBarHidden(true)
                            .padding(.bottom, 70)
                        }
                    }
                    
                    VStack {
                        Spacer()
                        BottomNavigationBarView()
                    }
                }
            }
        }
    }
}


struct SuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct topBarView: View {
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image("dots")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.all, 10)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 20))
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image("person")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .background(Color.white)
            })
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

struct SloganView: View {
    var body: some View {
        Text("Discover \nYour")
            .font(.system(size: 28))
            .fontWeight(.regular)
            .foregroundColor(Color("primary"))
        + Text(" Favourite Items!")
            .font(.system(size: 38))
            .fontWeight(.bold)
            .foregroundColor(Color("primary"))
    }
}

struct SearchView: View {
    
    @Binding var search: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 8)
                .foregroundColor(Color("primary"))
            TextField("Search Something New", text: $search)
        }
        .padding(.all, 15)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        
    }
}

struct CategoriesView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.all, 15)
                .frame(minWidth: 90)
            
                .foregroundColor(isActive ? Color.white : Color("primary"))
                .background(isActive ? Color.black : Color.white)
                .cornerRadius(15)
        }
        .padding(.trailing, 5)
    }
}

struct ProductView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack(spacing: 15) {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            VStack(spacing: 8) {
                Text("Casual Shirt")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack(spacing: 2) {
                    Text("$")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("99.0")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: size)
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(20)
        .cornerRadius(60, corners: [.topLeft, .bottomRight])
    }
}


struct BottomNavigationBarView: View {
    var body: some View {
        HStack {
            NavigationBarItem(image: Image("home"), action: {})
            NavigationBarItem(image: Image("heart"), action: {})
            NavigationBarItem(image: Image("chat"), action: {})
            NavigationBarItem(image: Image("cart"), action: {})
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct NavigationBarItem: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            image
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.horizontal, 30)
        })
    }
}

//from stackOverflow
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
