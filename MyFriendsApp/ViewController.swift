//
//  ViewController.swift
//  MyFriendsApp
//
//  Created by Abhijeet Aher on 11/10/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import UIKit

enum FetchDataFor{
    
    static let friendsUrl = "https://www.hackingwithswift.com/samples/friendface.json"
}

class ViewController: UITableViewController {

    var friendsArray = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.global().async {
            
        do{
            let url = URL(string: FetchDataFor.friendsUrl)!

            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let downloadedFriends = try decoder.decode([Friend].self, from: data)
            
            DispatchQueue.main.async {
                self.friendsArray = downloadedFriends
                self.tableView.reloadData()
            }
            
        }catch{
            
            print("Error while fetching the data")
        }
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = friendsArray[indexPath.row]
        
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.friends.map{$0.name}.joined(separator: ",")
        
        return cell
    }
    
}

