//
// Organization.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Organization: Codable {

    public var avatarUrl: String?
    public var blog: String?
    public var company: String?
    /** ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ */
    public var createdAt: String?
    public var email: String?
    public var followers: Int?
    public var following: Int?
    public var htmlUrl: String?
    public var _id: Int?
    public var location: String?
    public var login: String?
    public var name: String?
    public var publicGists: Int?
    public var publicRepos: Int?
    public var type: String?
    public var url: String?

    public init(avatarUrl: String?, blog: String?, company: String?, createdAt: String?, email: String?, followers: Int?, following: Int?, htmlUrl: String?, _id: Int?, location: String?, login: String?, name: String?, publicGists: Int?, publicRepos: Int?, type: String?, url: String?) {
        self.avatarUrl = avatarUrl
        self.blog = blog
        self.company = company
        self.createdAt = createdAt
        self.email = email
        self.followers = followers
        self.following = following
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
        case blog
        case company
        case createdAt = "created_at"
        case email
        case followers
        case following
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

