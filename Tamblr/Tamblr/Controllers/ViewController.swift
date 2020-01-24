//
//  ViewController.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 22.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {

    
    var array: [PostDataClass] = []
    let url = "http://api.tumblr.com/v2/tagged?tag="
    let apiKey = "&api_key=CcEqqSrYdQ5qTHFWssSMof4tPZ89sfx6AXYNQ4eoXHMgPJE03U"
    @IBOutlet weak var searchField: UITextField!
    
    func loadAction() {
        guard let txt = searchField.text else {
            return
        }
        print(txt)
        self.array.removeAll()
        self.tableView.reloadData()
        getPosts(key: txt) { (newPosts) in
            DispatchQueue.main.async {
                if newPosts.name != "name" && newPosts.description != "description" && newPosts.shortText != "shortText" {
                    self.array.append(newPosts)
                    self.tableView.reloadData()
                }
            }
        }
        
        searchField.text = ""
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadAction()
        self.view.endEditing(true)
        return true
    }
    @IBAction func searchPost(_ sender: Any) {
        loadAction()
        self.view.endEditing(true)
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchField.delegate = self
        
        tableView.reloadData()
    }


}



