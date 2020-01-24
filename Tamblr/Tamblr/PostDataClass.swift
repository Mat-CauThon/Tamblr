//
//  PostDataClass.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 24.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

class PostDataClass {
    var name: String
    var avatar: UIImage
    var postImage: UIImage
    var shortText: String
    var tags: [String]
    var description: String
    
    init(name: String, avatar: UIImage, postImage: UIImage, shortText: String, tags: [String], description: String) {
        self.name = name
        self.avatar = avatar
        self.postImage = postImage
        self.shortText = shortText
        self.tags = tags
        self.description = description
    }
    
}

    


