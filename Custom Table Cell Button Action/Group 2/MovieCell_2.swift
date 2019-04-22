//
//  MovieCell_1.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

protocol MovieCell_2Delegate: class {
    
    func likeButtonTapProtocol(_ cell: MovieCell_2) -> Void
    func dislikeButtonTapProtocol(_ cell: MovieCell_2) -> Void
}

class MovieCell_2: UITableViewCell {

    //Title
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    //Button
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    //Identifire
    static let identifire: String = "MovieCell_2"
    
    //Protocole
    weak var delegate: MovieCell_2Delegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
        self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
    }
 
    func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {
        
        if button.imageView?.image != nil {
            let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
            button.setImage(image, for: .normal)
            button.tintColor = color
        }
    }
    
    // MARK: - Like & Dislike Button Tap
    
    @IBAction func likeButtonTap(_ sender: UIButton) -> Void {
        
        //Send Delegate
        delegate?.likeButtonTapProtocol(self)
    }
    
    @IBAction func dislikeButtonTap(_ sender: UIButton) -> Void {
        
        //Send Delegate
        delegate?.dislikeButtonTapProtocol(self)
    }
    
}


