//
//  MovieTableViewCell.swift
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    // MARK: - Properties
    var movie: BBMovie? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let movie = movie else { return }
        titleMovieLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        BBMovieController.fetchImage(with: movie) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.moviePosterImageView.image = image
            }
        }
    }
}
