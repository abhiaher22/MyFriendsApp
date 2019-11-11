//
//  ViewController.swift
//  MyFriendsApp
//
//  Created by Abhijeet Aher on 11/10/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import UIKit


class ViewController: UITableViewController, UISearchResultsUpdating {

    var friendsArray = [Friend]()
    var filteredFriendsArray = [Friend]()
    
    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a freind..."
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        
         let decoder = JSONDecoder()
       decoder.dateDecodingStrategy = .iso8601
    
        decoder.decode([Friend].self, urlString: FetchDataFor.friendsUrl) { friends in
           
            if let friends = friends{
                self.friendsArray = friends
                self.filteredFriendsArray = friends
                self.tableView.reloadData()}
            else{
                Alert.display(withTitle: "Error", withMessage: "Error while fetching the data. Please try again!", onViewController: self)
            }
        }
    }

   //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = filteredFriendsArray[indexPath.row]
        
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.friendList
        
        return cell
    }
    
    //MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        filteredFriendsArray = friendsArray.containText(searchController.searchBar.text)
        tableView.reloadData()
    }
}

