//
//  ContentView.swift
//  NetworkJSON
//
//  Created by Leo on 2023/09/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {
        List(todos) { todo in
            VStack(alignment: .leading) {
                Text(todo.title!)
                    .padding(.bottom, 10)
                Text(todo.completed!.description)
                    .foregroundColor(todo.completed == true ? .red : .blue)
            }
        }
        .onAppear {
            WebService().getTodos { todo in
                self.todos = todo
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
