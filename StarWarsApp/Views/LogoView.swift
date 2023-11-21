//
//  LogoView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 20.11.2023.
//

import SwiftUI

struct LogoView: View {
  var title: String
  var textColor: Color?
  var borderColor: Color?

  var body: some View {
    VStack(alignment: .center) {
      ForEach(title.components(separatedBy: "\n"), id: \.self) { line in
        Text(line)
          .font(.custom("Starjedi", size: 100))
          .foregroundColor((borderColor != nil) ? borderColor : .black)
          .glowBorder(color: borderColor ?? Color.primaryYellow, lineWidth: 7)
          .padding(.vertical, -42)
          .multilineTextAlignment(.center)
      }
    }

  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView(title: "Star\nWars")
  }
}
