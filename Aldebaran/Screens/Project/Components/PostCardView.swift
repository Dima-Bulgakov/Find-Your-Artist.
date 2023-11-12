//
//  PostCardView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

// MARK: - PostCard for grid project
struct PostCardView: View {
    
    var post: Picture
    
    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
