//
//  Episode.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 17/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import SwiftUI

struct Episode: View {
    
    @EnvironmentObject var userData: UserData
    
//    var episodeId: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Episode_Previews: PreviewProvider {
    static var previews: some View {
        Episode()
    }
}
