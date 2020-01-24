//
//  CellDataClass.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 22.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

class CellDataClass: UITableViewCell {
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var shortText: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var imageConstraintWidth: NSLayoutConstraint!
    
    var data: PostDataClass?
    
    weak var delegate: CellDataClassDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewButton.addTarget(self, action: #selector(getPostDetails(_:)), for: .touchUpInside)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    @IBAction func getPostDetails(_ sender: UIButton) {
        if let data = data {
            self.delegate?.tableViewCell(self, detailsButtonTappedFor: data)
        }
    }
    
    
}
