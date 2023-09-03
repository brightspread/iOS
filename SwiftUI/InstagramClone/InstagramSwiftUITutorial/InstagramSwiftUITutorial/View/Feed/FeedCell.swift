//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image("ethan-hoover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("joker")
                    .font(.system(size: 14, weight: .semibold))
            }
            
            // post image
            Image("ethan-hoover")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: 440)
                .clipped()
            
            // action buttons
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }

                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }.foregroundColor(.black)
            
            // caption
            HStack {
                Text("batman").font(.system(size: 14, weight:  .semibold)) +
                Text(" All men have limits. They learn what they are and learn not to exceed them. I ignore mine.")
                    .font(.system(size: 15))
                
            }
            
            Text("2d")
                .font(.system(size: 14))
                . foregroundColor(.gray)
                .padding(.top)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
