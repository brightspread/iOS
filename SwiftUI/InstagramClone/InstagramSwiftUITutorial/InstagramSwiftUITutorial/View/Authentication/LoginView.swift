//
//  LoginView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/10.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Instagram")
                        .font(.system(size: 32))
                        .fontDesign(.serif)
                        .foregroundColor(.white)
                        .frame(width: 220, height: 100)
                    
                    VStack(spacing: 20) { // 별도 컨테이너로 스페이싱 관리
                        // email field
                        CustomTextField(text: $email, placeHolder: Text("Email"), imgName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomSecureField(text: $password, placeHolder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    // forgot password
                    HStack {
                        Spacer()
                        
                        Button {} label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }

                    }
                    
                    // sign in
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(.systemPurple)) // 프레임 세팅 이후에 넣어야함
                            .clipShape(Capsule()) // 프레임, 배경 이후에 넣어야함
                            .padding()
                    }
                    
                    Spacer()
                    // go to sign up
                    NavigationLink(destination: RegistrationView()
                        .navigationBarBackButtonHidden()) { // 내비바 숨기기
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign up")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)

                    }
                    
                }
                .padding(.bottom, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
