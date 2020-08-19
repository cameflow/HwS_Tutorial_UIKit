//
//  ViewController.swift
//  FileManager-UIKit
//
//  Created by Alejandro Terrazas on 15/08/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView   = UITableView()
    var pictures    = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storms"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        
        let fm      = FileManager.default
        let path    = Bundle.main.resourcePath!
        let items   = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 50
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let picture    = pictures[indexPath.row]
        let destVC     = DetailVC(selectedImage: picture)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}

