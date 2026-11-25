//
//  PostRowCell.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 22/11/26.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("POST #\(post.id)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                
                Spacer()
                
                Text("USER \(post.userId)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Text(post.title.capitalized)
                .font(.headline)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
