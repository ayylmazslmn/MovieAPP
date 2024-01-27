//
//  ContentView.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieListViewModel = MovieListViewModel()
    @State var movieSearch = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Movie Search", text: $movieSearch) {
                    if let encodedMovieName = movieSearch.trimmingCharacters(in: .whitespacesAndNewlines)
                        .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                        self.movieListViewModel.MovieSearching(MovieName: encodedMovieName)
                    } else {
                        // Handle the case where encoding fails, e.g., log an error or take appropriate action
                        print("Error encoding movie name.")
                    }
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

                List(movieListViewModel.Movies, id: \.imdbId) { movie in
                    NavigationLink(
                        destination: DetailView(imdbId: movie.imdbId), // Use 'movie.imdbId' here
                        label: {
                            HStack {
                                PrivateImage(url: movie.poster)
                                    .frame(width: 100, height: 150)

                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.title3)
                                        .foregroundColor(.blue)

                                    Text(movie.year)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    )
                }

                .navigationTitle(Text("Movies"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
