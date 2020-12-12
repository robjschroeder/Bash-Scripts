//
//  FirstViewController.swift
//  SelfServeKiosk
//
//  Created by Robert J Schroeder on 8/13/19.
//  Copyright © 2019 Robert J Schroeder. All rights reserved.
//
import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate {
    
    var requestsWebView: WKWebView!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        requestsWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        requestsWebView.uiDelegate = self
        view = requestsWebView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.azwestern.edu/kiosk")
        let myRequest = URLRequest(url: myURL!)
        requestsWebView.load(myRequest)
    }
    
    
}
