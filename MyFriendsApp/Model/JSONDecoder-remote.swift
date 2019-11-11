//
//  JSONDecoder-remote.swift
//  MyFriendsApp
//
//  Created by Abhijeet Aher on 11/10/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import Foundation

extension JSONDecoder{
    
    func decode < T: Decodable >(_ type : T.Type, urlString: String, completionHandler: @escaping (T?) -> ())
    {
        guard let url = URL(string: urlString) else {
            fatalError("bad url")
        }
        
        DispatchQueue.global().async {
        do{

            let data = try Data(contentsOf: url)
            let downloadedFriends = try self.decode(type, from: data)
            DispatchQueue.main.async {
                completionHandler(downloadedFriends)
            }
        }catch{
            
            print("Error while fetching the data")
     
                DispatchQueue.main.async {
                             completionHandler(nil)
                         }
        }
        }
        
        
        
    }
}
