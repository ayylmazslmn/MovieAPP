//
//  DetailView.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 27.01.2024.
//


import SwiftUI

struct DetailView: View {
    let imdbId: String

    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                PrivateImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Text(movieDetailViewModel.movieDetail?.title ?? "Movie Title")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()

                HStack {
                    Text("Director:")
                    Text(movieDetailViewModel.movieDetail?.director ?? "Unknown")
                        .foregroundColor(.secondary)
                }
                .padding()

                HStack {
                    Text("Writer:")
                    Text(movieDetailViewModel.movieDetail?.writer ?? "Unknown")
                        .foregroundColor(.secondary)
                }
                .padding()

                HStack {
                    Text("Awards:")
                    Text(movieDetailViewModel.movieDetail?.awards ?? "None")
                        .foregroundColor(.secondary)
                }
                .padding()

                HStack {
                    Text("Year:")
                    Text(movieDetailViewModel.movieDetail?.year ?? "Unknown")
                        .foregroundColor(.secondary)
                }
                .padding()

                Text(movieDetailViewModel.movieDetail?.plot ?? "No plot available.")
                    .foregroundColor(.primary)
                    .padding()

                // Watch Trailer Button
                Button("Watch Trailer") {
                    // Fragman izleme veya özel eylemi gerçekleştirme kodu
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                // Yıldız Değerlendirme Sistemi
                HStack {
                    Text("Rating:")
                        .foregroundColor(.primary)
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding()

                Spacer()
            }
            .padding()
            .onAppear(perform: {
                self.movieDetailViewModel.movieDetailcatch(imdbId: imdbId)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if movieDetailViewModel.movieDetail == nil {
                    ProgressView()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "Test")
    }
}
