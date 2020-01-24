//
//  CellDataClassDelegate.swift
//  Tamblr
//
//  Created by Roman Mishchenko on 24.01.2020.
//  Copyright © 2020 Roman Mishchenko. All rights reserved.
//

import UIKit

protocol CellDataClassDelegate: AnyObject {
    func tableViewCell(_ tableViewCell: CellDataClass, detailsButtonTappedFor cell: PostDataClass)
}
