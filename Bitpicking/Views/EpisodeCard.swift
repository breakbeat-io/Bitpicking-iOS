//
//  EpisodeCard.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 17/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct EpisodeCard: View {
    
    @EnvironmentObject var userData: UserData
    var episodeId: String
    @State private var tapped: Int? = 0
    
    var body: some View {
        
        let episode = userData.bitpickingRSS?.items?.first(where: { $0.guid!.value == episodeId })
        let episodeNumber = episode?.iTunes?.iTunesEpisode
        let episodeSeason = episode?.iTunes?.iTunesSeason
        
        
        let episodeCard =
            ZStack {
                VStack(alignment: .leading) {
                    KFImage(URL(string: (episode?.iTunes?.iTunesImage?.attributes?.href)!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 70)
                        .clipped()
                    VStack(alignment: .leading) {
                        Text(episode!.title!)
                            .padding(.bottom, 4)
                        Text("SEASON " + String(episodeSeason!) + " EPISODE " + String(episodeNumber!))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }.padding(.bottom, 16)
                        .padding(.leading, 8)

                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .onTapGesture {
                    self.tapped = 1
                }
                NavigationLink(
                    destination: Episode(),
                    tag: 1,
                    selection: self.$tapped
                ){
                    EmptyView()
                }
            }
            
            
            
            
            
            
            
            
            
        
        return episodeCard
    }
}

//struct EpisodeCard_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        EpisodeCard("test")
//    }
//}
