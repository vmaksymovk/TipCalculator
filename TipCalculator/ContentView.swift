//
//  ContentView.swift
//  TipCalculator
//
//  Created by Влад on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Main()
                .tabItem {
                    Label("Calculate", systemImage: "newspaper.circle")
                }
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
