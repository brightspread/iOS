//
//  CustomTextField.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/10.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeHolder: Text
    let imgName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color.init(UIColor(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
            
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""),
                        placeHolder: Text("Email"),
                        imgName: "envelope")
    }
}
