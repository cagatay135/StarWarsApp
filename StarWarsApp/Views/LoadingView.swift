//
//  LoadingView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 17.11.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
