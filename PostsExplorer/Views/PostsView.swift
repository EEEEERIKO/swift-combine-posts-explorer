//
//  PostsView.swift
//  CombinePostsExplorer
//
//  Created by Erik Valencia Cardona on 25/11/26.
//

import SwiftUI

struct PostsView: View {
    
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.posts.isEmpty {
                    loadingView
                } else if let error = viewModel.errorMessage {
                    errorView(error)
                } else if viewModel.posts.isEmpty {
                    emptyView
                } else {
                    postsList
                }
            }
            .navigationTitle("Posts Explorer")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.fetchPosts()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .disabled(viewModel.isLoading)
                }
            }
            .task{
                if viewModel.posts.isEmpty {
                    viewModel.fetchPosts()
                }
            }
        }
    }
    
    private var postsList: some View {
        List(viewModel.posts) { post in
            PostRowView(post: post)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(
                    EdgeInsets(
                        top: 6,
                        leading: 16,
                        bottom: 6,
                        trailing: 16
                    )
                )
        }
        .listStyle(.plain)
    }
    
    private var loadingView: some View {
        ProgressView("Loadding posts...")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func errorView(_ message: String) -> some View {
        ContentUnavailableView {
            Label("Something went wrong", systemImage: "wifi.exclamationmark")
        } description: {
            Text(message)
            
        } actions: {
            Button("Try Again") {
                viewModel.fetchPosts()
            }
        }
    }
    
    private var emptyView: some View{
        ContentUnavailableView(
            "No Posts Available",
            systemImage: "doc.text",
            description: Text("There are no posts to display")
        )
    }
}
