//
//  ContentView.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 16/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var userData: UserData
    
    @State private var selection = 0
 
    var body: some View {
        List(0..<userData.bitpickingRSS!.items!.count, id: \.self) { i in
            HStack{
                IfLet(self.userData.bitpickingRSS?.items?[i].iTunes?.iTunesSeason) { season in
                    Text(String(season))
                }
                IfLet(self.userData.bitpickingRSS?.items?[i].iTunes?.iTunesEpisode) { episode in
                    Text(String(episode))
                }
                Text(self.userData.bitpickingRSS!.items![i].title!)
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
