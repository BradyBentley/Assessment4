//
//  MovieDetailViewController.swift
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    // MARK: - Properties
    var movie: BBMovie?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let movie = movie else { return }
        movieTitleLabel.text = movie.title
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        ratingLabel.text = "Rating: \(movie.rating)"
        voteLabel.text = "Votes: \(movie.votes)"
        BBMovieController.fetchImage(with: movie) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.moviePosterImageView.image = image
            }
        }
    }
}
