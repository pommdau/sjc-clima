//
// UserUserId.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct UserUserId: Codable {

    public var avatarUrl: String?
    public var bio: String?
    public var blog: String?
    public var company: String?
    /** ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ */
    public var createdAt: String?
    /** Note: The returned email is the user’s publicly visible email address (or null if the user has not specified a public email address in their profile). */
    public var email: String?
    public var followers: Int?
    public var following: Int?
    public var gravatarId: String?
    public var hireable: Bool?
    public var htmlUrl: String?
    public var _id: Int?
    public var location: String?
    public var login: String?
    public var name: String?
    public var publicGists: Int?
    public var publicRepos: Int?
    public var type: String?
    public var url: String?

    public init(avatarUrl: String?, bio: String?, blog: String?, company: String?, createdAt: String?, email: String?, followers: Int?, following: Int?, gravatarId: String?, hireable: Bool?, htmlUrl: String?, _id: Int?, location: String?, login: String?, name: String?, publicGists: Int?, publicRepos: Int?, type: String?, url: String?) {
        self.avatarUrl = avatarUrl
        self.bio = bio
        self.blog = blog
        self.company = company
        self.createdAt = createdAt
        self.email = email
        self.followers = followers
        self.following = following
        self.gravatarId = gravatarId
        self.hireable = hireable
        self.htmlUrl = htmlUrl
        self._id = _id
        self.location = location
        self.login = login
        self.name = name
        self.publicGists = publicGists
        self.publicRepos = publicRepos
        self.type = type
        self.url = url
    }

    public enum CodingKeys: String, CodingKey { 
        case avatarUrl = "avatar_url"
        case bio
        case blog
        case company
        case createdAt = "created_at"
        case email
        case followers
        case following
        case gravatarId = "gravatar_id"
        case hireable
        case htmlUrl = "html_url"
        case _id = "id"
        case location
        case login
        case name
        case publicGists = "public_gists"
        case publicRepos = "public_repos"
        case type
        case url
    }


}

