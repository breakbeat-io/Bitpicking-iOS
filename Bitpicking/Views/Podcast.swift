//
//  Podcast.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 17/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI

struct Podcast: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Season 2")) {
                    ForEach(0..<userData.bitpickingRSS!.items!.count, id: \.self) { i in
                        Group {
                            if (self.userData.bitpickingRSS?.items?[i].iTunes?.iTunesSeason == 2) {
                                EpisodeCard(episodeId: self.userData.bitpickingRSS!.items![i].guid!.value!)
                            }
                        }
                    }
                }
                Section(header: Text("Season 1")) {
                    ForEach(0..<userData.bitpickingRSS!.items!.count, id: \.self) { i in
                        Group {
                            if (self.userData.bitpickingRSS?.items?[i].iTunes?.iTunesSeason == 1) {
                                EpisodeCard(episodeId: self.userData.bitpickingRSS!.items![i].guid!.value!)
                            }
                        }
                    }
                }
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .navigationBarTitle("Episodes")
        }
        
    }
}

struct Podcast_Previews: PreviewProvider {
    static var previews: some View {
        Podcast()
    }
}
