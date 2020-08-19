//
//  DetailVC.swift
//  FileManager-UIKit
//
//  Created by Alejandro Terrazas on 15/08/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var imageView = UIImageView()
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        configureImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    init(selectedImage: String) {
        super.init(nibName: nil, bundle: nil)
        	
        self.selectedImage  = selectedImage
        title               = selectedImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        imageView.contentMode = .scaleAspectFit
    }
    

}
