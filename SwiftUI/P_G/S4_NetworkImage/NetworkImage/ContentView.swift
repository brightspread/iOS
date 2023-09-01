//
//  ContentView.swift
//  NetworkImage
//
//  Created by Leo on 2023/09/01.
//

import SwiftUI

// https://64f1bbba0e1e60602d2433a9.mockapi.io/user

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(users) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            HStack {
                                URLImage(urlString: user.avatar)
                                    .frame(width: 100, height: 100)
                                Text("\(user.name)")
                                Spacer()
                            }
                        }

                    }
                }
            }
            .navigationTitle(Text("User List"))
        }
        .onAppear {
            WebService().loadUsers { (users) in
                self.users = users
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
