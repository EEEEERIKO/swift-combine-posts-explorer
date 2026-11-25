//
//  PostServiceProtocol.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 22/11/26.
//
import Combine

protocol PostServiceProtocol {
    func fetchPosts() -> AnyPublisher<[Post], Error>
}

