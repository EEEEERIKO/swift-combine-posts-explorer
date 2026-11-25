//
//  Post.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 22/11/26.
//

import Foundation

struct Post: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

