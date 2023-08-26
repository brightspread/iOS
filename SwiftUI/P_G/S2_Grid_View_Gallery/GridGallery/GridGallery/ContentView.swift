//
//  ContentView.swift
//  GridGallery
//
//  Created by Leo on 2023/08/27.
//

import SwiftUI



struct ContentView: View {
    
    var items = Item.dummyData
    
    @State private var selectedGridType: GridType = .single
    
    var body: some View {
        VStack {
            GridTypePicker(gridType: $selectedGridType)
            
            ScrollView {
                LazyVGrid(columns: selectedGridType.columns) {
                    ForEach(items) { item in
                        
                        switch selectedGridType {
                        case .single,
                                .double:
                            SingleRow(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .animation(.default) // 레이아웃 변경시 부드럽게 변경
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
