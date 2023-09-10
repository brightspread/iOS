//
//  RegistrationView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/10.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State private var imagePickerPresented = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                if let `image` = image {
                    `image`
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                } else {
                    Button(action: { imagePickerPresented.toggle() }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.white)
                    }.sheet(isPresented: $imagePickerPresented,
                            onDismiss: loadImage,
                            content: {
                        ImagePicker(image: $selectedImage)
                    })
                    .padding()
                }
                
                VStack(spacing: 20) { // 별도 컨테이너로 스페이싱 관리
                    // email field
                    CustomTextField(text: $email, placeHolder: Text("Email"), imgName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $userName, placeHolder: Text("Username"), imgName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeHolder: Text("Full Name"), imgName: "person")
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
                
                // sign in
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.systemPurple)) // 프레임 세팅 이후에 넣어야함
                        .clipShape(Capsule()) // 프레임, 배경 이후에 넣어야함
                        .padding()
                }
                
                Spacer()
                // go to sign up
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }
            }
            .padding(.bottom, 16)
        }
        
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
