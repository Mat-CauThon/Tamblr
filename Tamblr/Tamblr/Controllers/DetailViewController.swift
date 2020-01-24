//
//  DetailViewController.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 24.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var postData: PostDataClass!
    @IBOutlet weak var imageConstraintWidth: NSLayoutConstraint!
    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
//    @IBAction func backAction(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        postImage.image = postData.postImage
        authorName.text = postData.name
        textLabel.text = postData.description
        imageConstraintWidth!.constant = view.frame.size.width
        imageConstraintHeight!.constant = postData.postImage.size.height * (view.frame.size.width) / postData.postImage.size.width
//        if imageConstraintHeight!.constant > view.frame.size.height/2 {
//            imageConstraintHeight!.constant = view.frame.size.height/2.5
//            imageConstraintWidth!.constant = postData.postImage.size.width * (view.frame.size.height/2.5) / postData.postImage.size.height
//        }
        
        print("HAHAHHAHA")
        
    }
    
}
