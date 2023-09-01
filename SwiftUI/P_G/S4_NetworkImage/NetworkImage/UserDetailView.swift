//
//  UserDetailView.swift
//  NetworkImage
//
//  Created by Leo on 2023/09/01.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack() {
            URLImage(urlString: user.avatar)
                .frame(width: UIScreen.main.bounds.size.width,
                height: 250)
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
            Spacer()
        }
    }
}
