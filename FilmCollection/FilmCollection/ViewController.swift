//
//  ViewController.swift
//  FilmCollection
//
//  Created by Ann on 18.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbWithFilms: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
    }
    

    
    func getMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9991ac17a29a5156480361b1b146d373") as! URL
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let dataJson = try JSONDecoder().decode(MoviewsResponse.self, from: data!)
                DispatchQueue.main.async {
                    self.movies = dataJson.results
                    self.tbWithFilms.reloadData()
                }
                print(dataJson)
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tbWithFilms.dequeueReusableCell(withIdentifier: "FilmCell") as! FilmCell
        cell.set(movie: movie)
        return cell
    }
}

