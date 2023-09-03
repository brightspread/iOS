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
            ForEach(0..<100, id: \.self) { _ in
                FeedCell()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
