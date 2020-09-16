//
//  ViewController.swift
//  GuessTheFlag-UIKit
//
//  Created by Alejandro Terrazas on 17/08/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button_01       = UIButton()
    var button_02       = UIButton()
    var button_03       = UIButton()
    
    var countries       = [String]()
    var score           = 0
    var correctAnswer   = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureButtons()
        setupCountries()
        askQuestion()
    }
    
    func configureButtons() {
        view.addSubview(button_01)
        view.addSubview(button_02)
        view.addSubview(button_03)
        
        button_01.layer.borderWidth = 1
        button_02.layer.borderWidth = 1
        button_03.layer.borderWidth = 1
        
        button_01.layer.borderColor = UIColor.systemGray.cgColor
        button_02.layer.borderColor = UIColor.systemGray.cgColor
        button_03.layer.borderColor = UIColor.systemGray.cgColor
        
        button_01.tag = 0
        button_02.tag = 1
        button_03.tag = 2
        
        button_01.translatesAutoresizingMaskIntoConstraints = false
        button_02.translatesAutoresizingMaskIntoConstraints = false
        button_03.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button_01.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button_01.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button_01.widthAnchor.constraint(equalToConstant: 200),
            button_01.heightAnchor.constraint(equalToConstant: 100),
            
            button_02.topAnchor.constraint(equalTo: button_01.bottomAnchor, constant: 20),
            button_02.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button_02.widthAnchor.constraint(equalToConstant: 200),
            button_02.heightAnchor.constraint(equalToConstant: 100),
            
            button_03.topAnchor.constraint(equalTo: button_02.bottomAnchor, constant: 20),
            button_03.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button_03.widthAnchor.constraint(equalToConstant: 200),
            button_03.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        button_01.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button_02.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button_03.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender:UIButton!){
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func setupCountries(){
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button_01.setImage(UIImage(named: countries[0]), for: .normal)
        button_02.setImage(UIImage(named: countries[1]), for: .normal)
        button_03.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }


}

