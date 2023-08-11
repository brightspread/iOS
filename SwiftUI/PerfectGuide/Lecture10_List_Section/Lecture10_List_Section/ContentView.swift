//
//  ContentView.swift
//  Lecture10_List_Section
//
//  Created by Leo on 2023/08/10.
//

import SwiftUI

// List Section

// 1. 기본구조
// 2. data 가공 (원하는 형태로 표현)


//model
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let index: Int
}

struct ContentView: View {
    
    var animalList = [
        Animal(name: "dog", index: 1),
        Animal(name: "dog", index: 3),
        Animal(name: "dog", index: 4),
        Animal(name: "cat", index: 5),
        Animal(name: "cat", index: 2),
        Animal(name: "cat", index: 9),
        Animal(name: "cat", index: 8),
        Animal(name: "bird", index: 7),
        Animal(name: "bird", index: 6),
    ]
    
    // dog : [dog, dog, dog], cat : [cat, cat, cat, cat] , ..
    var animalGrouped: [String: [Animal]] {
        var groupData = Dictionary(grouping: animalList) { $0.name }
        for (key, value) in groupData {
            groupData[key] = value.sorted(by: {$0.index < $1.index})
        }
        return groupData
    }
    
    var groupKey: [String] {
        animalGrouped.map({ $0.key })
    }
    
    var body: some View {
        List {
            // 그룹키는 하나하나 구분이 되지 않음(id 없으니까)
            ForEach(groupKey, id:\.self) { animalKey in
                Section(header: Text("\(animalKey)")) {
                    ForEach(animalGrouped[animalKey]!) { animal in
                        HStack {
                            Text("\(animal.name)")
                            Text("\(animal.index)")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
