//
//  MovieListVC_2.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieListVC_2: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //View Controller Title
        self.title = "Movies List 2"
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(UINib(nibName: MovieCell_2.identifire, bundle: nil), forCellReuseIdentifier: MovieCell_2.identifire)
        
    }
    
    func likeButtonTapProtocol(_ cell: MovieCell_2) {
        
        print("likeButtonTapProtocol Tag:- \(cell.tag)")
        
        let indexPath = self.tableview.indexPath(for: cell)
        
        let movie = moviesList[(indexPath?.row)!]
        //Show Alert With Message
        DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
    }
    
    func dislikeButtonTapProtocol(_ cell: MovieCell_2) {
        
        print("dislikeButtonTapProtocol Tag:- \(cell.tag)")
        
        let indexPath = self.tableview.indexPath(for: cell)
        
        let movie = moviesList[(indexPath?.row)!]
        //Show Alert With Message
        DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
    }
}

extension MovieListVC_2 : UITableViewDataSource, UITableViewDelegate, MovieCell_2Delegate {
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_2.identifire, for: indexPath) as! MovieCell_2
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        
        //Set Delegate
        cell.delegate = self
        
        return cell
    }
    
}
