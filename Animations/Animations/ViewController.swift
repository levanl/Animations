//
//  ViewController.swift
//  Animations
//
//  Created by Levan Loladze on 12.11.23.
//

import UIKit

class ViewController: UIViewController {

    let tbcTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = UIColor(red: 50/255, green: 174/255, blue: 199/255, alpha: 1)
//        rgb(50,174,199)
        label.alpha = 0.0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupTbcLabel()
    }
    
    
    func setupTbcLabel() {
        view.addSubview(tbcTitleLabel)
        
        NSLayoutConstraint.activate([
            tbcTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbcTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        showHideLabel()
                
    }
    
    func showHideLabel() {
        UIView.animate(withDuration: 2.0, animations: {
            self.tbcTitleLabel.center.y -= 50
            self.tbcTitleLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 2.0, animations: {
                self.tbcTitleLabel.center.y += 50
                self.tbcTitleLabel.alpha = 0.0
            }, completion: { _ in
                self.showHideLabel()
            })
        })
    }


}

