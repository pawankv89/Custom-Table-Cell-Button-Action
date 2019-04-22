//
//  MovieListVC_1.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieListVC_4: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //View Controller Title
        self.title = "Movies List 4"
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(UINib(nibName: MovieCell_4.identifire, bundle: nil), forCellReuseIdentifier: MovieCell_4.identifire)
        
    }
}

extension MovieListVC_4 : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_4.identifire, for: indexPath) as! MovieCell_4
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        
        //Like Button Tap
        cell.likeButtonAction = { sender in
            // Do whatever you want from your button here.
            
            let indexPath = self.tableview.indexPath(for: sender as! UITableViewCell)
            
            let movie = self.moviesList[(indexPath?.row)!]
            //Show Alert With Message
            DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
        }
        
        //DisLike Button Tap
        cell.dislikeButtonAction = { sender in
            // Do whatever you want from your button here.
            
            let indexPath = self.tableview.indexPath(for: sender as! UITableViewCell)
            
            let movie = self.moviesList[(indexPath?.row)!]
            //Show Alert With Message
            DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
        }
        
        return cell
    }
    
}
