//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import Foundation

import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var Movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func MovieSearching(MovieName: String) {
        
        downloaderClient.DownloadMovies(search: MovieName) { result in
            
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let listMovie):
                
                if let listMovie = listMovie {
                    DispatchQueue.main.async {
                        DispatchQueue.main.async {
                            
                            self.Movies = listMovie.map(MovieViewModel.init)
                        }
                       
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    
    let Movie : Movie
    
    var title : String{
        
        Movie.title
    }
    var poster : String{
        
        Movie.poster
    }
    var year : String{
        Movie.year
    }
    var imdbId : String{
        
        Movie.imdb
    }
    
    
    
}

