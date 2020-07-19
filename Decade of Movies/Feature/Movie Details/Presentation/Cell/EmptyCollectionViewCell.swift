//
//  EmptyCollectionViewCell.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

public class EmptyCollectionViewCell: UICollectionViewCell, NibOwnerLoadable, Reusable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadNibContent()
    }
}
