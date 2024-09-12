//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Foundation

struct Profile: Decodable {
    let name, role, introduction: String
    let languages: [Language]
    let jobs, education: [Experience]
    let projects: [Project]
    let links: [SocialLink]
}

struct Experience: Decodable {
    let title, role, place, interval: String
    let responsabilities: [String]
}

struct Project: Decodable {
    let name, description: String
    let links: [SocialLink]
}

struct Language: Decodable {
    let language, level: String
}

struct SocialLink: Decodable {
    let icon, description, link: String
}
