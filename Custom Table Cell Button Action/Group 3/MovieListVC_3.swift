//
//  MovieListVC_3.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieListVC_3: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //View Controller Title
        self.title = "Movies List 3"
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(UINib(nibName: MovieCell_3.identifire, bundle: nil), forCellReuseIdentifier: MovieCell_3.identifire)
        
    }
    
}

extension MovieListVC_3 : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_3.identifire, for: indexPath) as! MovieCell_3
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        
        cell.tableView = tableView
        cell.moviesList = moviesList
        
        return cell
    }
    
}
