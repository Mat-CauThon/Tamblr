//
//  SearchBar.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 22.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit
import Foundation

extension ViewController {
    
    
    func getPosts(key: String, completion:@escaping (PostDataClass)->()) {
        let fullUrl = url + key + apiKey
        let safeURL = fullUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let newUrl = URL(string: safeURL)!
        let task = URLSession.shared.dataTask(with: newUrl) { data, response, err in
            
            guard let data = data, err == nil else {
                completion(PostDataClass(name: "name", avatar: UIImage(), postImage: UIImage(), shortText: "title", tags: [], description: "description"))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let parsedDict = json as? [String: Any] else {return}
                
                print(parsedDict)
                
                guard let newsDict = parsedDict["response"] as? [Any] else {return}
                for somePost in newsDict {
                    
                    
                    guard let postInfo = somePost as? [String: Any] else { print("Cant get post info"); return}
                    guard let type = postInfo["type"] as? String else { print("Cant get type info"); return}
                    guard let tags = postInfo["tags"] as? [String] else { print("Cant get blog info"); return}
                   
                    guard let blog = postInfo["blog"] as? [String: Any] else { print("Cant get blog info"); return}
                    guard let name = blog["name"] as? String else { print("Cant get name info"); return}
                    guard var title = blog["title"] as? String else { print("Cant get title info"); return}
                    guard let description = blog["description"] as? String else { print("Cant get description info"); return}
                    
                    let photos = postInfo["photos"] as? [Any]
                    
                    var imageURL = ""
                    for photo in photos ?? [] {
                        guard let photoInfo = photo as? [String: Any] else { print("Cant get photo info"); return}
                        guard let original_size = photoInfo["original_size"] as? [String: Any] else { print("Cant get original_size info"); return}
                        guard let imageURLG = original_size["url"] as? String else { print("Cant get photo url info"); return}
                        imageURL = imageURLG
                    }
                    
                    
                    
                    
                    guard let trail = postInfo["trail"] as? [Any] else { print("Cant get trail info"); return}
                    
                    var headerImage = ""
                    for item in trail {
                        guard let itemInfo = item as? [String: Any] else { print("Cant get trail item info"); return}
                        guard let trailBlog = itemInfo["blog"] as? [String: Any] else { print("Cant get trailBlog info"); return}
                        guard let theme = trailBlog["theme"] as? [String: Any] else { print("Cant get theme info"); return}
                        guard let header_image = theme["header_image"] as? String else { print("Cant get image url"); return}
                        headerImage = header_image
                    }
                    
                    
                    
                    if type != "photo" && type != "text" && type != "answer"{
                        title += "|UNSUPPORTED CONTENT"
                    }
                    var photo: UIImage?
                    let urlPhoto = NSURL(string: imageURL)
                    
                    if let imageData: NSData = NSData(contentsOf: urlPhoto! as URL) {
                        photo = UIImage(data: imageData as Data)
                    }
                    var image: UIImage?
                    let urlImage = NSURL(string: headerImage)
                    
                    if let imageData: NSData = NSData(contentsOf: urlImage! as URL) {
                        image = UIImage(data: imageData as Data)
                    }
                    if photo == nil {
                        let urlPhotoNil = NSURL(string: "https://www.edmontoncorporatechallenge.com/Sports%20Icons/unknown-challenge.png")
                        if let imageData: NSData = NSData(contentsOf: urlPhotoNil! as URL) {
                            photo = UIImage(data: imageData as Data)
                        }
                    }
                    if image == nil {
                        let urlImageNil = NSURL(string: "https://www.edmontoncorporatechallenge.com/Sports%20Icons/unknown-challenge.png")
                        if let imageData: NSData = NSData(contentsOf: urlImageNil! as URL) {
                            image = UIImage(data: imageData as Data)
                        }
                    }
                    let newPost = PostDataClass(name: name, avatar: image!, postImage: photo!, shortText: title, tags: tags, description: description)
//                    posts.append(newPost)
                    completion(newPost)
                }
                
            } catch {
                print("Failed convert")
            }
            
        }
        task.resume()
    }
    

}
