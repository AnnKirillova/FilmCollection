//
//  FilmCell.swift
//  FilmCollection
//
//  Created by Ann on 18.05.2021.
//

import UIKit
import Kingfisher

class FilmCell: UITableViewCell {

    @IBOutlet weak var percentView: UIView!
    
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var petsentOfPopular: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var informationAboutFilm: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func set(movie: Movie){
        name.text = movie.original_title
        petsentOfPopular.text = String(movie.vote_average)
        informationAboutFilm.text = movie.overview
        date.text = movie.release_date
        percentView.backgroundColor = getColour(by: movie.vote_average)
        let imgURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        imageFilm.kf.setImage(with: imgURL)
    }
    
    func getColour(by rate: Double) -> UIColor{
        let green: CGFloat = CGFloat(rate * 0.1)
        let red: CGFloat = CGFloat((10 - rate) * 0.1)
        return UIColor(red: red, green: green, blue: 0, alpha: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       prepareView()
        
    }
    
    func prepareView(){
        percentView.layer.borderWidth = 1
        percentView.layer.borderColor = UIColor.white.cgColor
        percentView.layer.cornerRadius = percentView.frame.height/2
//            imageInTableView.frame.height/2
        percentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
