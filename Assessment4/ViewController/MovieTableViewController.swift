//
//  MovieTableViewController.swift
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    // MARK: - Properties
    var movie: [BBMovie] = []
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movie = self.movie[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMovieDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as? MovieDetailViewController
            let movie = self.movie[indexPath.row]
            destinationVC?.movie = movie
        }
    }
}

// MARK: - SearchBarDelegate
extension MovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = movieSearchBar.text, !searchTerm.isEmpty else { return }
        BBMovieController.fetchMovie(withName: searchTerm) { (movies) in
            guard let movies = movies else { return }
            self.movie = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieSearchBar.text = ""
            }
        }
    }
}
