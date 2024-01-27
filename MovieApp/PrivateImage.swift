//
//  PrivateImage.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import SwiftUI

struct PrivateImage: View {
    
    let url : String
     @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
     
     init(url:String) {
         self.url = url
         self.imageDownloaderClient.ImageDownload(url: self.url)
     }
     
     var body: some View {
         if let data = self.imageDownloaderClient.ImageDownload {
             return Image(uiImage: UIImage(data: data)!)
                 .resizable()
                 
         } else {
             return Image("place")
                 .resizable()
         }
     }
 }

struct PrivateImage_Previews: PreviewProvider {
    static var previews: some View {
        PrivateImage(url: "https://m.media-amazon.com/images/M/MV5BMWRjZTBiNjAtN2Q5Ni00Yjg5LWIwNTUtMDVhN2NjOWYwOTU0XkEyXkFqcGdeQXVyNjE0MTY2NjY@._V1_SX300.jpg")
    }
}
