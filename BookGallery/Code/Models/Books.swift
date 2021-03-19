//
//  Books.swift
//  BookGallery
//
//  Created by Shubham Singh on 19/03/21.
//

import Foundation

struct Book: Hashable {
    let id: Int
    let name: String
    let author: String
    let chapterCount: Int
    let image: String
    let rating: Double
}

struct BookShelf {
    let id: Int
    var books: [Book]
    let shelfTitle: String
}
