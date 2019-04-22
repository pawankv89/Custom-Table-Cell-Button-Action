//
//  MovieListVC_1.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieListVC_1: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //View Controller Title
        self.title = "Movies List 1"
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(UINib(nibName: MovieCell_1.identifire, bundle: nil), forCellReuseIdentifier: MovieCell_1.identifire)
        
    }
    
    // MARK: - Like & Dislike Button Tap
    
    @objc func likeButtonTap(_ sender: UIButton) -> Void {
        
        print("likeButtonTap Tag:- \(sender.tag)")
        
         let movie = moviesList[sender.tag]
        //Show Alert With Message
        DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
    
    }
    
    @objc func dislikeButtonTap(_ sender: UIButton) -> Void {
        
        print("dislikeButtonTap Tag:- \(sender.tag)")
        
        let movie = moviesList[sender.tag]
        //Show Alert With Message
        DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
    }
    
}

extension MovieListVC_1 : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_1.identifire, for: indexPath) as! MovieCell_1
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        
        //Like Button
        cell.likeButton.addTarget(self, action: #selector(likeButtonTap(_:)), for: .touchUpInside)
        //Set Tag
        cell.likeButton.tag = indexPath.row
        
        //DisLike Button
        cell.dislikeButton.addTarget(self, action: #selector(dislikeButtonTap(_:)), for: .touchUpInside)
        //Set Tag
        cell.dislikeButton.tag = indexPath.row
        
        return cell
    }
    
}
