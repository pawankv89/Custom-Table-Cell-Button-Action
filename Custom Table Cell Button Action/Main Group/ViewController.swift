//
//  ViewController.swift
//  Custom Table Cell Button Action
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class MovieNameDataSource: NSObject {
    
    class func moviesList() -> [Movie] {
        let moviesList = [
            
            Movie(name:"Movies List 1" , details: "Custom Cell Button Send Event by Runtime"),
            Movie(name:"Movies List 2" , details: "Custom Cell Button Send Event by Protocol"),
            Movie(name:"Movies List 3" , details: "Custom Cell Button Send Event by Button Tap Action"),
            Movie(name:"Movies List 4" , details: "Custom Cell Button Send Event by Closure")
        ]
        return moviesList
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    fileprivate let moviesList = MovieNameDataSource.moviesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(UINib(nibName: MovieCell.identifire, bundle: nil), forCellReuseIdentifier: MovieCell.identifire)
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("prepare ViewController:-\(String(describing: segue.identifier))")
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell.identifire, for: indexPath) as! MovieCell
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        return cell
    }
    
    // MARK: - Navigation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let movie = moviesList[indexPath.row]
    
        if movie.name == "Movies List 1" {
            
            //Move to Another Screen
            self.performSegue(withIdentifier: "MovieListVC_1", sender: nil)
        } else  if movie.name == "Movies List 2" {
            
            //Move to Another Screen
            self.performSegue(withIdentifier: "MovieListVC_2", sender: nil)
        } else  if movie.name == "Movies List 3" {
            
            //Move to Another Screen
            self.performSegue(withIdentifier: "MovieListVC_3", sender: nil)
        } else  if movie.name == "Movies List 4" {
            
            //Move to Another Screen
            self.performSegue(withIdentifier: "MovieListVC_4", sender: nil)
        }
        
        
        
    }
}
