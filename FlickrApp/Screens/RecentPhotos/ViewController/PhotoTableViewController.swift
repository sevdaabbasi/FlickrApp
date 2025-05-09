//
//  PhotoTableViewController.swift
//  FlickrApp
//
//  Created by Sevda Abbasi on 8.05.2025.
//

import UIKit

class PhotoTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{return}
        if text.count > 2{
            print(text)
            searchPhotos(with: text)
        }

    }
    
    //private var response: PhotosResponse?
    
    
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
    
    private func fetchRecentPhotos(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{return}
        //Data task bizden aslında bir request bekliyor
        let reguest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: reguest) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            // eğer error yoksa
            if let data = data{
                // data yı json a çevir
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                
                print(json)
            }
        }.resume()
    }
    
    private func searchPhotos(with text: String){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{return}
        //Data task bizden aslında bir request bekliyor
        let reguest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: reguest) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            // eğer error yoksa
            if let data = data{
                // data yı json a çevir
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                
                print(json)
            }
        }.resume()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
        cell.ownerImageView.backgroundColor = .darkGray
        cell.ownerNameLabel.text = "Name"
        cell.photoImageView.backgroundColor = .gray
        cell.titleName.text = "Title Name"
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
