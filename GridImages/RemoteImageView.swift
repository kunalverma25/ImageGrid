//
//  RemoteImageView.swift
//  GridImages
//
//  Created by Kunal Verma on 18/04/24.
//

import SwiftUI

struct RemoteImageView: View {
    let url: URL
    @State private var image: UIImage? = nil
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                // Placeholder or loading indicator can be added here
                ProgressView()
            }
        }
        .onAppear(perform: loadImage)
    }
    
    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                // Handle error
                print("Failed to load image:", error ?? "Unknown error")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

#Preview {
    RemoteImageView(url: URL(string: "https://via.placeholder.com/150")!)
}
