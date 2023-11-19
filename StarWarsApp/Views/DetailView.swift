//
//  DetailView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 17.11.2023.
//

import SwiftUI
import AVKit

struct DetailView: View {
  var movie: Movie?
  @State private var showNewText = false

  @State private var crawlOpeningTextVisible = true

  @State private var crawlTitleVisible = true
  @State private var crawlTitleScale: CGFloat = 3.0

  @State var audioPlayer: AVAudioPlayer!


  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
        if crawlOpeningTextVisible {
          Text("A long time ago in a galaxy far, far away...")
            .foregroundColor(Color.primaryBlue)
            .font(.system(size: 40))
            .frame(maxWidth: 680)
            .opacity(crawlOpeningTextVisible ? 1 : 0)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation {
                  crawlOpeningTextVisible = false
                }
              }
              DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                withAnimation {
                  crawlTitleVisible = false
                  let sound = Bundle.main.path(forResource: "star-wars", ofType: "mp3")
                  self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                  self.audioPlayer.play()
                }
              }
            }
        }
          
        
          if !crawlTitleVisible {
              ZStack {
                  Image("space")
                      .ignoresSafeArea()
                  if !crawlTitleVisible {
                      Text("STAR WARS")
                          .foregroundColor(.yellow)
                          .font(.custom("Starjedi", size: 100))
                          .multilineTextAlignment(.center)
                          .scaleEffect(crawlTitleScale)
                          .onAppear {
                              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                  withAnimation(.easeInOut(duration: 1)) {
                                      crawlTitleScale = 0.0
                                  }
                              }
                              DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    showNewText = true
                              }
                          }
                  }
                  
                  if showNewText {
                      CrawlTextView(
                        movie: movie!
                      )
                      .padding(.top,400)

                  }
              }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView()
  }
}
