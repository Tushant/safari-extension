//
//  SafariExtensionViewController.swift
//  navi-extension
//
//  Created by Tushant Khatiwada on 8/27/18.
//  Copyright © 2018 Tushant Khatiwada. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    
    @IBOutlet weak var message: NSTextField!
    @IBOutlet weak var email: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!
    static let shared = SafariExtensionViewController()
    override func viewDidLoad() {
        self.preferredContentSize = NSSize(width: 300, height: 250)
        message.stringValue = "email value is"
    }
    
    
    @IBAction func userLogin(_ sender: Any) {
        print("email ----> \(email.stringValue)")
        print("password ---> \(password.stringValue)")
        let parameters = ["email": email.stringValue, "password": password.stringValue]
        message.stringValue = "email is \(email.stringValue) \n pass is \(password.stringValue)"
        let URI = URL(string: "https://api.production.navihq.com/auth/sign_in")
        let session = URLSession.shared
        var request = URLRequest(url: URI!)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error{
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        print("request \(request)")
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print("############################")
                    print(json)
                    // handle json...
                }
            } catch let error {
                print("*************************")
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
