//
//  ContentView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    static let service = Service()
    private let starWarsService = StarWarsService(service: Self.service)
    
    @State private var filmTitle: String = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(filmTitle)
        }
        .padding()
        .onAppear {
            starWarsService.getFilm(endPoint: .getFilm(id: 1)) { result in
                switch result {
                case .success(let film):
                    // Başarılı bir şekilde veri alındı, film başlığını kullanabilirsiniz.
                    self.filmTitle = film.title
                case .failure(let error):
                    // Hata durumunda
                    print("Hata: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
