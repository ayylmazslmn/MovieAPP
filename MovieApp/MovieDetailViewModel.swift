//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 27.01.2024.
//

import Foundation
import SwiftUI


class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func movieDetailcatch(imdbId : String) {
        
        downloaderClient.MovieDetailDownload(imdbId: imdbId) { (result) in
            
            switch result {
            case.failure(let error):
                print(error)
            case.success(let MovieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel (detail: MovieDetail)
                }
                
            }
        }
    }
}

struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    
    var title : String {
            detail.title
        }
        
        var poster : String {
            detail.poster
        }
        
        var year : String {
            detail.year
        }
        
        var imdbId : String {
            detail.imdbId
        }
        
        var director : String {
            detail.director
        }
        
        var writer : String {
            detail.writer
        }
        
        var awards : String {
            detail.awards
        }
        
        var plot : String {
            detail.plot
        }
        
    }
