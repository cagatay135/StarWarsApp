//
//  DetailView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 17.11.2023.
//

import AVKit
import SwiftUI

struct CrawlAnimationView: View {
  var movie: Movie?
  @State private var showIntroText = true
  @State private var showLogoText = false
  @State private var logoTextScale: CGFloat = 4.0
  @State private var showOpeningCrawlText = false
  @State var audioPlayer: AVAudioPlayer!

  private let openingTextDuration = 4.0
  private let openingTextDelay = 4.0
  private let logoAnimationDuration: TimeInterval = 13.0
  private let logoAnimationDelay: TimeInterval = 0.1
  private let newTextDelay: TimeInterval = 0.5
  private let song = "star-wars"

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      if showIntroText {
        Text("A long time ago in a galaxy far, far away...")
          .foregroundColor(Color.primaryBlue)
          .font(.system(size: 40))
          .frame(maxWidth: 680)
          .opacity(showIntroText ? 1 : 0)
          .animation(.easeInOut(duration: openingTextDuration))
          .onAppear {
            self.startOpeningTextAnimation()
          }
      }

      if showLogoText {
        ZStack {
          Image("space")
            .ignoresSafeArea()
          if showLogoText {
            LogoView(title: "Star\nWars")
              .scaleEffect(logoTextScale)
              .onAppear {
                self.startLogoAnimation()
              }
          }

          if showOpeningCrawlText {
            CrawlTextView(
              movie: movie!
            )
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }

  private func startOpeningTextAnimation() {
    DispatchQueue.main.asyncAfter(deadline: .now() + openingTextDelay) {
      withAnimation {
          showIntroText = false
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + openingTextDelay + 1.0) {
      withAnimation {
        showLogoText = true
        playAudio()
      }
    }
  }

  private func startLogoAnimation() {
    DispatchQueue.main.asyncAfter(deadline: .now() + logoAnimationDelay) {
      withAnimation(.easeInOut(duration: logoAnimationDuration)) {
        logoTextScale = 0.0
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + logoAnimationDuration + newTextDelay) {
      showOpeningCrawlText = true
    }
  }

  private func playAudio() {
    let sound = Bundle.main.path(forResource: song, ofType: "mp3")
    audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    audioPlayer.play()
  }

}

struct CrawlAnimationView_Previews: PreviewProvider {
  static var previews: some View {
      CrawlAnimationView()
  }
}
