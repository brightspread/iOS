//
//  ContentView.swift
//  Lecture12_AlertView
//
//  Created by Leo on 2023/08/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowAlert = false
    @State private var selectText = "x"

    var body: some View {
        VStack {
            Spacer()
            Button("show alert") {
                isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert) {
                let primaryButton = Alert.Button.default(Text("done")) {
                    selectText = "done"
                }
                let secondaryButton = Alert.Button.default(Text("cancel")) {
                    selectText = "cancel"
                }
                
                return Alert(title: Text("show alert"),
                             primaryButton: primaryButton,
                             secondaryButton: secondaryButton)
            }
            
            Spacer()
            Text("\(isShowAlert.description)")
            Spacer()
            Text("\(selectText.description)")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
