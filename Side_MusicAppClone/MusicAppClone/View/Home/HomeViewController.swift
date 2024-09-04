//
//  ViewController.swift
//  MusicAppClone
//
//  Created by temp_name on 9/3/24.
//

import UIKit
import FlexLayout
import PinLayout
import RxSwift

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        
        let myLabel: UILabel = {
            let label: UILabel = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.view.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

