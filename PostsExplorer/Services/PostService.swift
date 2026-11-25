//
//  PostService.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 22/11/26.
//

import Combine
import Foundation


final class PostService: PostServiceProtocol {
    
    private let url = URL(
        string: "https://jsonplaceholder.typicode.com/posts"
    )!
    
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(
                receiveSubscription: { _ in
                    print("Starting API request...")
                },
                receiveOutput: { data, response in
                    print("Received \(data.count) bytes")

                    if let response = response as? HTTPURLResponse {
                        print("HTTP Status: \(response.statusCode)")
                    }
                },
                receiveCompletion: { completion in
                    print("Network completion: \(completion)")
                }
            )
            .tryMap { data, response in

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }

                return data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
