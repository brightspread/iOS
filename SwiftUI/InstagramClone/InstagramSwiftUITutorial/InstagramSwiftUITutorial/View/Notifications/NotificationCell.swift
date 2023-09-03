//
//  NotificationCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            Image("ethan-hoover")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("batman").font(.system(size: 14, weight:  .semibold)) +
            Text(" liked one of your posts")
                .font(.system(size: 15))

            Spacer()
           
            if showPostImage {
                Image("ethan-hoover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
            
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
