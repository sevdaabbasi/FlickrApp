//
//  PhotoTableViewController.swift
//  FlickrApp
//
//  Created by Sevda Abbasi on 8.05.2025.
//

import UIKit





class PhotoTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    private var characters: [Character] = []
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > 2 {
            print(text)
            searchPhotos(with: text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        fetchRecentPhotos()
    }

    // UISerachControl işlemlerini atama işlemi
    private func setupSearchController(){
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Ara"
        navigationItem.searchController = search
    
        
    
    }
    
    private func fetchRecentPhotos() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CharacterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.characters = response.results
                        self?.tableView.reloadData()
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
    
    private func searchPhotos(with text: String) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CharacterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.characters = response.results
                        self?.tableView.reloadData()
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
        let character = characters[indexPath.row]
        
        cell.ownerNameLabel.text = character.name
        cell.titleName.text = character.name
        
        // Load image from URL
        if let imageUrl = URL(string: character.image) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.photoImageView.image = image
                    }
                }
            }.resume()
        }
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    // diyor ki eğer bir storyboard tabanlı bir yönlendirme yapıyorsan araya girip bu şekilde bu methodu kullanabilirsin
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as?
        PhotoTableViewController{
            //TODO: Seçilen fotoğrafı detay ekranına gönder
            
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
   
   
        
       
    }
