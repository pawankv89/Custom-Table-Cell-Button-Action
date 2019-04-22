//
//  DisplayMessage.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class DisplayMessage: NSObject {

    //Shared Object
    static let shared = DisplayMessage()
    
    //Constructor
    private override init() {
        
    }
    
    //MARK:- Set Firebase Analytics logEvent
    public func showAlertWithMessage(message: String, imageName: String) -> () {
        
        let imageView = UIImageView(frame: CGRect.init(x: 20, y: 20, width: 25, height: 25))
        imageView.image = UIImage(named: imageName)
        self.imageViewTintColor(imageView: imageView, color: UIColor.blue)
        
        let alert = UIAlertController(title: "Thanks For share your feedback.", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.view.addSubview(imageView)
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { action in
            print("Show Alert With Message")
        }))
        
        //Key Window add All View here
        let keyWindow: UIWindow = (UIApplication.shared.keyWindow)!
        
        keyWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func imageViewTintColor(imageView: UIImageView, color: UIColor) -> Void {
        
        if imageView.image != nil {
            imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
        }
    }
    
}
