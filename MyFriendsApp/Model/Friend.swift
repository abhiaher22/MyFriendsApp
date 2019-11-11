//
//  friend.swift
//  MyFriendsApp
//
//  Created by Abhijeet Aher on 11/10/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import Foundation

struct Friend: Codable {
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Connection]
    
    var friendList: String {
       friends.map{$0.name}.joined(separator: ",")
    }
}


extension Array where Element == Friend {
    
    func containText(_ searchString: String?) -> [Friend]{
        
        if  let searchString = searchString, searchString.count > 0{
            return  self.filter{
            $0.name.contains(searchString) ||
            $0.address.contains(searchString) ||
            $0.company.contains(searchString) }
        }else{
            return self
        }
    }
}
