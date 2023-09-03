//
//  UserStatView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
            
        }
        .frame(width: 80, alignment: .center)
        // 프레임 설정을 안하면 Text를 기반으로 width를 맞추지만,
        // 여기서는 80으로 고정한다
    }
}
struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 2, title: "Post")
    }
}
