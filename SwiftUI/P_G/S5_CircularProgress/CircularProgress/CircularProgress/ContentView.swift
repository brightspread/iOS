//
//  ContentView.swift
//  CircularProgress
//
//  Created by Leo on 2023/09/01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
                .padding(.bottom, 100)
            CircularProgressBar(progress: $progress)
        }.padding(40)
    }
}

struct CircularProgressBar: View {
    
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.3), lineWidth: 20)
            Circle()
                .trim(from: 0.0, to: progress)
//                    .stroke(.red, lineWidth: 20)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(progress == 1 ? .green : .red)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: UUID())
            
            Text("\(String(format: "%.2f", (progress * 100)))" + "%")
                .foregroundColor(progress == 1 ? .green : .red)
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
