//
//  ContentView.swift
//  Lecture9_List_ForEach
//
//  Created by Leo on 2023/08/05.
//

import SwiftUI

// List
// Model

// Model
struct LocationInfo: Hashable, Identifiable {
    var id = UUID()
    
    var city = ""
    var weather = ""
}

struct ContentView: View {
    
    @State private var locations = [
        LocationInfo(city: "seoul", weather: "sunny"),
        LocationInfo(city: "busan", weather: "cloudy"),
        LocationInfo(city: "la", weather: "rainy")
    ]
    
    var body: some View {
        List {
            ForEach(locations, id: \.self) { location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            // id: 어떤 값을 id로 할 것인지,
            // 고유한 값이 있으면 그걸 쓰면 되는데,
            // 없으니까 \.self (하나하나 아이템을 고유한 것으로 사용) -> Hasable 프로토콜 준수

            
            
            ForEach(locations) { location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            
            // Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'LocationInfo' conform to 'Identifiable'
            // id 없이 쓰려면 Identifiable 이어야함

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
