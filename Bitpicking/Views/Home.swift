//
//  ContentView.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 16/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var selection = 0
 
    var body: some View {
        TabView {
            Latest()
                .tabItem {
                    Image(systemName: "pin")
                    Text("Latest")
                }
            Podcast()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Podcast")
                }
            TV()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Bitpicking TV")
                }
        }
    }
}


struct IfLet<Value, Content: View>: View {
    private let value: Value?
    private let contentProvider: (Value) -> Content

    init(_ value: Value?,
         @ViewBuilder content: @escaping (Value) -> Content) {
        self.value = value
        self.contentProvider = content
    }

    var body: some View {
        value.map(contentProvider)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
