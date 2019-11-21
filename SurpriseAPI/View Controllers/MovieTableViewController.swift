//
//  MovieTableViewController.swift
//  SurpriseAPI
//
//  Created by Kyle Jennings on 11/21/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    @IBOutlet weak var movieTextField: UITextField!
    
    // MARK: - VARIABLES
    var movie: Movie? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieTextField.text = ""
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func movieSearchButtonTapped(_ sender: UIBarButtonItem) {
        guard let movieText = movieTextField.text, !movieText.isEmpty else {return}
        MovieController.fetchMovie(searchText: movieText) { (result) in
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if movie != nil {
            return 1
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)

        if let movie = movie {
            cell.textLabel?.text = movie.title
            cell.detailTextLabel?.text = "Rating: \(movie.imdbRating)"
            }
        

        return cell
    }
}
