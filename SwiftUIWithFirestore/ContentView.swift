//
//  ContentView.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: HomeView()) {
                Text("Navigate to HomeView")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
