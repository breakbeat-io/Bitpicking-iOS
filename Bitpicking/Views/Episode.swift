//
//  Episode.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 17/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct Episode: View {
    
    @EnvironmentObject var userData: UserData
    var episodeId: String
    
    var body: some View {
        
        let episode = userData.bitpickingRSS?.items?.first(where: { $0.guid!.value == episodeId })
        let episodeNumber = episode?.iTunes?.iTunesEpisode
        let episodeSeason = episode?.iTunes?.iTunesSeason

        let episodeView =
            
            ScrollView {
                VStack(alignment: .leading) {
                    KFImage(URL(string: (episode?.iTunes?.iTunesImage?.attributes?.href)!))
                    .resizable()
                    .cornerRadius(16)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                Text("SEASON " + String(episodeSeason!) + " EPISODE " + String(episodeNumber!))
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(episode!.title!)
                    .font(.title)
                    .padding(.vertical)
                HStack {
                    Spacer()
                    Button(action: {
                        UIApplication.shared.open(URL(string: episode!.link!)!)
                    }) {
                        HStack {
                            Image(systemName: "play.fill")
                                .font(.headline)
                            Text("Play in your podcast player")
                                .font(.headline)
                        }
                        .padding()
                        .foregroundColor(.primary)
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                    }
                    Spacer()
                }.padding(.bottom)
                    Text(episode!.description!)
                    .font(.body)
                }
            }
            .padding(.horizontal)
        
        
        return episodeView
    }
}


//struct Episode_Previews: PreviewProvider {
//    static var previews: some View {
//        Episode()
//    }
//}
