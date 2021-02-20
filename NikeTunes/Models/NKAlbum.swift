//
//  NKAlbum.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import Foundation

struct Main: Codable {
    let feed: Content
}

struct Content: Codable {
    let title: String
    let id: String
    let author: [String: String]
    let results: [NKAlbum]
}

struct NKAlbum: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let copyright: String
    let genres: [OneGenre]
    let url: String
}

struct OneGenre: Codable {
    let name: String
}
