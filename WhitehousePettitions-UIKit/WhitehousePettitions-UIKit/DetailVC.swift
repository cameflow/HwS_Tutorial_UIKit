//
//  DetailVC.swift
//  WhitehousePettitions-UIKit
//
//  Created by Alejandro Terrazas on 16/09/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import UIKit
import WebKit

class DetailVC: UIViewController {
    
    var webView     = WKWebView()
    var detailItem: Petition?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = webView
        
        guard let detailItem = detailItem else { return }

        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)

    }
    



}
