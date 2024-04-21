//
//  ImageGridView.swift
//  GridImages
//
//  Created by Kunal Verma on 18/04/24.
//

import SwiftUI

struct ImageGridView: View {
    
    
    
    let imageURLs = [
        URL(string: "https://via.placeholder.com/150")!,
        URL(string: "https://via.placeholder.com/200")!,
        URL(string: "https://via.placeholder.com/250")!,
        URL(string: "https://via.placeholder.com/300")!,
        URL(string: "https://via.placeholder.com/350")!,
        // Add more image URLs as needed
    ]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(imageURLs, id: \.self) { imageURL in
                    RemoteImageView(url: imageURL)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Images Grid")
    }
}

#Preview {
    ImageGridView()
}
