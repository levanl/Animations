//
//  ViewController.swift
//  Animations
//
//  Created by Levan Loladze on 12.11.23.
//

import UIKit

class ViewController: UIViewController {

    let gradient = CAGradientLayer()
    
    let tbcTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .black
        label.alpha = 1.0
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let startColor = UIColor(red: 140/255.0, green: 249/255.0, blue: 2/255.0, alpha: 1.0)
        let endColor = UIColor(red: 67/255.0, green: 23/255.0, blue: 288/255.0, alpha: 1.0)
        self.gradient.frame = self.view.bounds
        self.gradient.colors = [startColor.cgColor, UIColor.red.cgColor, endColor.cgColor]
        self.gradient.startPoint = CGPoint(x: 0, y: 0)
        self.gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.gradient.locations = [0,0]
        self.view.layer.addSublayer(self.gradient)
        setupTbcLabel()
        
    }

    
    func setupTbcLabel() {
        view.addSubview(tbcTitleLabel)
        
        NSLayoutConstraint.activate([
            tbcTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbcTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        animateGradinet()
        transformLabel()
        resizeLable()
                
    }
    
    func transformLabel() {
        UIView.animate(withDuration: 4.0, animations: {
            self.tbcTitleLabel.transform = self.tbcTitleLabel.transform.rotated(by: CGFloat.pi/2)
            self.tbcTitleLabel.transform = self.tbcTitleLabel.transform.rotated(by: CGFloat.pi/2)
            self.animateGradinet()
        }, completion: { _ in
            UIView.animate(withDuration: 4.0, animations: {
                self.tbcTitleLabel.transform = self.tbcTitleLabel.transform.rotated(by: -CGFloat.pi/2)
                self.tbcTitleLabel.transform = self.tbcTitleLabel.transform.rotated(by: -CGFloat.pi/2)
            }, completion: { _ in
                self.transformLabel()
            })
        })
    }
    
    func resizeLable() {
        UIView.animate(withDuration: 2.0, animations: {
            self.tbcTitleLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
        })
    }
    
    func animateGradinet() {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [-0.5, -0.25, 0]
        gradientAnimation.toValue = [1.0, 1.25, 1.5]
        gradientAnimation.autoreverses = true
        gradientAnimation.duration = 4.0
        self.gradient.add(gradientAnimation, forKey: nil)
    }

}

