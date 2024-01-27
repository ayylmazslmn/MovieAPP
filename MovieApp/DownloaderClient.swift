//
//  DownloaderClient.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import Foundation

class DownloaderClient {
    
    func DownloadMovies(search: String, completion: @escaping (Result<[Movie]?,DownloaderError>) -> Void) {
        
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=e8791201") else {
            
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            guard let MovieAnswer = try? JSONDecoder().decode(ListMovies.self, from: data)
                    
            else {
                return completion(.failure(.dataNotProcessed))
            }
            
            completion(.success(MovieAnswer.movies))
            
        }.resume()
        
    }
    
    func MovieDetailDownload(imdbId : String, completion: @escaping
    (Result<MovieDetail, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=e8791201") else {
            
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data , response, error) in
            
            guard let data = data , error == nil else {
                
                return completion(.failure(.noData))
            }
            guard let MoviesDetails = try? JSONDecoder().decode(MovieDetail.self, from: data)
            else{
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(MoviesDetails))
            
        }.resume()
    }
    
    
    enum DownloaderError: Error {
        
        
    case wrongUrl
    case noData
    case dataNotProcessed
        
        
        
        
    }
}
