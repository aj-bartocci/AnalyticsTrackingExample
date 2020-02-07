//
//  ViewController.swift
//  Analytics
//
//  Created by AJ Bartocci on 2/5/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet
    private weak var userIdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction
    private func login() {
        Current.analytics.send(.user(.loggedIn(userId: userIdField.text ?? "")))
    }
    
    @IBAction
    private func logout() {
        Current.analytics.send(.user(.loggedOut))
    }
    
    @IBAction
    private func unexpectedResponse() {
        Current.analytics.send(.api(.unexpectedResponse(endpoint: "/user/1")))
    }
    
    @IBAction
    private func timeout() {
        Current.analytics.send(.api(.timeout(endpoint: "/user-info")))
    }

}

