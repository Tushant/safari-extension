//
//  SafariExtensionViewController.swift
//  navi-extension
//
//  Created by Tushant Khatiwada on 8/27/18.
//  Copyright © 2018 Tushant Khatiwada. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    @IBOutlet weak var password: NSSecureTextField!
    static let shared = SafariExtensionViewController()
    override func viewDidLoad() {
        self.preferredContentSize = NSSize(width: 300, height: 300)
    }
}
