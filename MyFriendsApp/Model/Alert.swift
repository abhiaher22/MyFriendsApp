//
//  Alert.swift
//  MyFriendsApp
//
//  Created by Abhijeet Aher on 11/10/19.
//  Copyright © 2019 Abhijeet Aher. All rights reserved.
//

import UIKit

enum Alert{

static func display(withTitle title: String, withMessage message : String , onViewController vc: UIViewController){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    vc.present(alertController, animated: true)
    }
}
