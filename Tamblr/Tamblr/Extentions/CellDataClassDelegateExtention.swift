//
//  CellDataClassDelegateExtention.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 24.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

extension ViewController: CellDataClassDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            if let info = sender as? PostDataClass {
                let pvc = segue.destination as! DetailViewController
                pvc.postData = info
            }
        }
    }
    
    func tableViewCell(_ tableViewCell: CellDataClass, detailsButtonTappedFor cell: PostDataClass) {
        
        performSegue(withIdentifier: "Details", sender: cell)
    }
}
