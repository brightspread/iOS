//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image? // SwiftUI 에서 사용하는 Image
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle() // true로 변경
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template) // 사진 색상
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerPresented) { // true 일 때 sheet로 열림
                    loadImage() // dismiss 될 때 불림
                } content: {
                    ImagePicker(image: $selectedImage)
                }
                
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..", text: $captionText)
                }
                
                Button {
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }.padding()
                
            }
            Spacer()
        }
        
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
