//
//  logInView.swift
//  loginP1
//
//  Created by MacBOOK Pro on 24/12/22.
//

import SwiftUI

struct logInView: View {
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isLinkActive1 = false
    @State var isLinkActive2 = false
    
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .topLeading) {
                VStack {
                    VStack (spacing: 40){
                        ZStack{
                            Ellipse()
                                .frame(width: 510, height: 478)
                                .padding(.leading, -200)
                                .foregroundColor(Color("color2"))
                                .padding(.top, -200)
                            
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("color1"))
                                .padding(.top, -200)
                            
                            Text("Welcome \nBack")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                        
                        VStack (spacing: 30) {
                            VStack (spacing: 30) {
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor1", tOpacity: 0.6, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor1", tOpacity: 0.6, value: $password)
                            }
                            
                            VStack {
                                
                                NavigationLink(destination: SuccessfulView(), isActive: $isLinkActive1) {
                                    
                                    Button(action: {
                                        self.isLinkActive1 = true
                                    }, label: {
                                        CustomButton(title: "SIGN IN", bgcolor: "color1")
                                    })
                                    
                                }
                                
                                Text("Forgot Password?")
                                    .fontWeight(.medium)
                                
                            }.padding(.horizontal, 20)
                            
                            HStack {
                                Button(action: {}, label: {
                                    Image("fb")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 60)
                                        .padding(.vertical, 15)
                                        .background(Color("button-bg"))
                                        .cornerRadius(15)
                                })
                                Spacer()
                                
                                
                                Button(action: {}, label: {
                                    Image("google")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 60)
                                        .padding(.vertical, 15)
                                        .background(Color("button-bg"))
                                        .cornerRadius(15)
                                })
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: SignUpView(), isActive: $isLinkActive2) {
                            Button(action: {
                                self.isLinkActive2 = true
                            }, label: {
                                Text("SIGN UP")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color("color1"))
                                    .fontWeight(.bold)
                            })
                        }
                    }
                    
                    .frame(height: 63)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("color2"))
                    .ignoresSafeArea()
                }
                
            }
            
            .edgesIgnoringSafeArea(.bottom)
        }
        
        .navigationBarHidden(true)
        
    }
}

struct logInView_Previews: PreviewProvider {
    static var previews: some View {
        logInView()
    }
}
