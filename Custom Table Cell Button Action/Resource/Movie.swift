//
//  Movie.swift
//  DynamicCellHeight Demo
//
//  Created by Pawan kumar on 31/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class Movie: NSObject {
    let name: String
    let details: String
    
    init(name: String, details: String) {
        self.name = name
        self.details = details
    }
 
    //MARK:- Convert Model to Dictionary
    func convertToDict() -> [String: Any] {
        
        var parameters : Dictionary <String, Any> = [:]
        parameters["name"] = self.name
        parameters["details"] = self.details
        return parameters
    }
}
