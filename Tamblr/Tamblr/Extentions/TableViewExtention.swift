//
//  TableViewExtention.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 24.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = array.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as! CellDataClass
        
        let post = array[indexPath.row]
        
        cell.authorName.text = post.name
        cell.authorImage.image = post.avatar
        cell.shortText.text = post.shortText
        var txt = ""
        for item in post.tags {
            print(item)
            txt += "#\(item) "
        }
        cell.tags.text = txt
        
        
        cell.postImage.image = post.postImage
        cell.imageConstraintWidth.constant = view.frame.size.width
        cell.imageConstraintHeight.constant = post.postImage.size.height * (view.frame.size.width) / post.postImage.size.width
        
        cell.data = array[indexPath.row]
        
        cell.delegate = self
        return cell
        
    }
}

