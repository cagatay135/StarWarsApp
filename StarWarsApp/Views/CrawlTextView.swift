import SwiftUI

struct CrawlTextView: View {
    var movie: Movie
    var animationDuration = 55.0
    @State private var offset: CGFloat = 1000

    var body: some View {
        VStack {
            Text("\(movie.episodeID)\n\(movie.title)\n\n\(movie.openingCrawl)")
                .font(.custom("Starjedi", size: 30))
                .foregroundColor(.primaryYellow)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding()
                .offset(y: offset)
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .frame(height: 2000)
                .onAppear {
                    withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                        self.offset = -1000
                    }
                }
        }
    }
}

struct CrawlTextView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleMovie = Movie(title: "A New Hope", episodeID: 4, openingCrawl: "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....", director: "", producer: "", releaseDate: "", characters: [""], planets: [""], starships: [""], vehicles: [""], species: [""], created: "", edited: "", url: "")
        
        CrawlTextView(movie: exampleMovie)
    }
}
