//
//  ViewController.swift
//  Elo7
//
//  Created by Mauricio Olimpio on 31/07/17.
//  Copyright © 2017 Mauricio Olimpio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string: "http://localhost:8080/carreiras.html"){
            webview.loadRequest(URLRequest(url:url));
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

