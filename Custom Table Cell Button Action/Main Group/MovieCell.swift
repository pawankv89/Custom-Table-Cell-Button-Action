//
//  MovieCell.swift
//  DynamicCellHeight Demo
//
//  Created by Pawan kumar on 31/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let identifire: String = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
