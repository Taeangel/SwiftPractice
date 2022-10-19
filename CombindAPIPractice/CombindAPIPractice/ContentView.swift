//
//  ContentView.swift
//  CombindAPIPractice
//
//  Created by song on 2022/10/18.
//
import Combine
import SwiftUI

struct ContentView: View {
  
  @StateObject var vm = ViewModel()
  
  var body: some View {
    VStack {
      List(vm.comments) { comment in
        Text(comment.email)
        Text("\(comment.postId)")
      }
    }
    .onAppear {
      vm.fetchComments_withCombine()
    }
  }
}

class ViewModel: ObservableObject {
  @Published var comments: [Comment] = []
  let combineService = CombineImplementation()
  var subscription = Set<AnyCancellable>()
  
  func fetchComments_withCombine() {
    combineService.getUsers()
      .flatMap { [weak self] users -> AnyPublisher<[Post], Error> in
        if let user = users.last, let self = self {
          return self.combineService.getPostFromUserId(userId: user.id)
        } else {
          return Fail(error: APIError.emptyUsers).eraseToAnyPublisher()
          
        }
      }.flatMap { [weak self] posts -> AnyPublisher<[Comment], Error> in
        if let post = posts.last, let self = self {
          return self.combineService.getCommentFromPostId(postId: post.id)
        } else {
          return Fail(error: APIError.emptyPosts).eraseToAnyPublisher()
        }
      }.sink(receiveCompletion: { result in
        switch result {
        case .failure(let error):
          print("\(error)")
        default:
          print("성공")
        }
      }, receiveValue: { comments in
        DispatchQueue.main.async {
          self.comments = comments
        }
      })
      .store(in: &subscription)
  }
}

enum APIError: Error {
  case emptyUsers
  case emptyPosts
  case emptyComment
}


struct User: Decodable {
  let id: Int
  let name: String
}

struct Post: Decodable {
  let id: Int
  let userId: Int
  let title: String
}

struct Comment: Identifiable, Decodable {
  let id: Int
  let postId: Int
  let email: String
}


struct CombineImplementation {
  
  func getUsers() -> AnyPublisher<[User], Error> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [User].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
  func getPost() -> AnyPublisher<[Post], Error> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [Post].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
  func getPostFromUserId(userId: Int) -> AnyPublisher<[Post], Error> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [Post].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
  func getCommentFromPostId(postId: Int) -> AnyPublisher<[Comment], Error> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [Comment].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
  
}



struct AwaitAsyncImplementation {
  
}
