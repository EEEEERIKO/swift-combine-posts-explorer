//
//  PostsViewModel.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 22/11/26.
//


import Foundation
import Combine

@MainActor
final class PostsViewModel: ObservableObject {
    
    @Published private(set) var posts: [Post] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private let service: PostServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    
    init(service: PostServiceProtocol = PostService()) {
        self.service = service
    }
    
    func fetchPosts() {
        
        isLoading = true
        errorMessage = nil
        
        service.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let self else { return }

                self.isLoading = false

                if case .failure(let error) = completion {
                    print("Fetch error: \(error)")
                    self.errorMessage = error.localizedDescription
                }

            } receiveValue: { [weak self] posts in

                print("Received \(posts.count) posts")
                self?.posts = posts

            }
            .store(in: &cancellables)
    }
}
