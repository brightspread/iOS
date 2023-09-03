//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) { // Lazy : 네트워크 콜
                // 셀이 메모리 캐시에 배치됨
                // 그 이후 다시 표시할 수 있도록 캐시에서 꺼냄
                // 이런 이미지들은 API 를 통해 들어옴.
                // 따라서 메모리 사용량이 우리가 사용하는 것보다 훨씬 높을 것.
                // Lazy를 쓰면 좀 나음. 스크롤, 앱 성능 좋아짐
                ForEach(0..<10) { _ in
                    FeedCell()
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
