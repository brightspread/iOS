//
//  ContentView.swift
//  Lecture24_Binding
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myBool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination:
                                DetailView(mainToggleValue: $myBool)) { // 데이터 바인딩
                    Text("Navigate")
                }
                
                Toggle(myBool.description, isOn: $myBool)
            }
            .frame(width: 200)
        }
    }
}

struct DetailView: View {
    @Binding var mainToggleValue: Bool // Binding은 값 지정 안되고, 타입 지정만 가능
    
    var body: some View {
        Toggle("detail toggle", isOn: $mainToggleValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
