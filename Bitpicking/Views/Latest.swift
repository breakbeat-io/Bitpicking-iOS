//
//  Latest.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 17/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI

struct Latest: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        let episode = userData.bitpickingRSS?.items![0]
        let latestView =
            VStack(alignment: .leading) {
                Text("The Bitpicking Podcast")
                    .font(.largeTitle)
                    .padding()
                Text("Latest Episode")
                    .font(.title)
                    .padding()
                Episode(episodeId: (episode?.guid?.value)!)
        }
        
        return latestView
    }
}

struct Latest_Previews: PreviewProvider {
    static var previews: some View {
        Latest()
    }
}
