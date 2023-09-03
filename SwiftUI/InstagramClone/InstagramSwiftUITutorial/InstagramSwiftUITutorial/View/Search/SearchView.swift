//
//  SearchView.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText)
            
            // grid view / user list view
            PostGridView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
