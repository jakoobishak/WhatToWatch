//
//  AdditionalInfoView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct AdditionalInfoView: View {
    
    var movie : MovieDetails
    
    var body: some View {
        Text("\(movie.title)")
    }
}

/*struct AdditionalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalInfoView()
    }
}*/
