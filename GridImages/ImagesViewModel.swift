//
//  ImagesViewModel.swift
//  GridImages
//
//  Created by Kunal Verma on 18/04/24.
//

import Foundation

class ImagesViewModel {
    @Published var images: [ImageObject] = []
    
    func fetchImages() {
        
    }
}

struct ImageObject {
    var id: String
    var imageURL: String
}
