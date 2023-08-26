//
//  Item.swift
//  GridGallery
//
//  Created by Leo on 2023/08/27.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTItle: String
    let imageName: String
    
    static var dummyData: [Item] {
        
//        var temp = [Item]()
//
//        for index in 0...30 {
//            temp.append(
//                Item(mainTitle: "Main Title Index\(index)",
//                 subTItle: "Sub Title Index\(index)",
//                 imageName: "movie\(index % 3 + 1)")
//                )
//        }
//
//        return temp

        (0...30).map {
            Item(mainTitle: "Main Title Index\($0)",
                 subTItle: "Sub Title Index\($0)",
                 imageName: "movie\($0 % 3 + 1)")
        }
    }
}
