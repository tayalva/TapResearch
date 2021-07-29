//
//  SurveyUnavailableVC.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import UIKit

class SurveyUnavailableVC: UIViewController {
    
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Blast! that survey isn't available"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var dismissLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to dismiss"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sadface")
        imageView.tintColor = .white.withAlphaComponent(0.5)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        
        view.addSubview(messageLabel)
        view.addSubview(dismissLabel)
        view.addSubview(imageView)
    }
    
    private func setupConstraints() {
        messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 25).isActive = true
        
        dismissLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        dismissLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        dismissLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
