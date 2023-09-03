//
//  ProfileHeaderView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ethan-hoover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Follwers")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing)
            }
            
            Text("Bruce Wayne")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Night || Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack { // 버튼 가운데 정렬
                Spacer()
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
                Spacer()
            }.padding(.top)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
