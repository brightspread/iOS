//
//  SingleRowLayout.swift
//  GridGallery
//
//  Created by Leo on 2023/08/27.
//

import Foundation
import SwiftUI

struct SingleRow: View {
    let item: Item

    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            VStack {
                Spacer() // 아래로 밀기
                HStack {
                    VStack(alignment: .leading) { // 두 텍스트의 정렬
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTItle)
                            .font(.subheadline)
                            .lineLimit(1)

                    }
                    Spacer() // 왼쪽으로 밀기
                }
                .padding(10) // 텍스트 살짝 띄기
                .background(.white.opacity(0.5))
            }
        }
    }
}

struct SingleRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleRow(item: Item(
            mainTitle: "Main Title",
            subTItle: "Sub Title",
            imageName: "movie3")
        )
    }
}
