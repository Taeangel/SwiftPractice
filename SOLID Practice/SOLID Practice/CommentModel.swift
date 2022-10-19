//
//  CommentModel.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

struct CommentModel: Codable, Identifiable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}


struct UserModel: Codable, Identifiable {
    let id: Int?
    let name, email: String?

}

