//
//  ViewController.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import UIKit
import WebKit

class MainVC: UIViewController {
    
    var service = NetworkManager()
    
    var getSurveyButton: UIButton = {
       let button = UIButton()
        button.setTitle("Get Survey", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(getSurveyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 10
        return webView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }

    func setupUI() {
        view.backgroundColor = .systemFill
        view.addSubview(getSurveyButton)
        view.addSubview(webView)
    }
    
    func setupConstraints() {
        getSurveyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        getSurveyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getSurveyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        getSurveyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        webView.topAnchor.constraint(equalTo: getSurveyButton.bottomAnchor, constant: 25).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
}
    
    @objc func getSurveyButtonTapped() {
      //I would normally put this logic in a viewModel/Interactor, but since this was a small test app I just left it here in the VC
        if let retreivedPayload = StoreResponseHelper.retreivePayload() {
            if let url = URL(string: retreivedPayload.offerUrl) {
                let request = URLRequest(url: url)
                self.webView.load(request)
                print("Got Paylaod from Saved Data")
            }
         return
        }
        
        service.makeRequest { response, error in
            
            guard let response = response else {
                self.showSurveyUnavailableVC()
                return
            }
            
            StoreResponseHelper.storePayload(response)
            switch response.hasOffer {
            case true:
                if let url = URL(string: response.offerUrl) {
                    let request = URLRequest(url: url)
                    self.webView.load(request)
                    print("made a new call to get payload")
                }
            case false:
                self.showSurveyUnavailableVC()
            }            
        }
    }
    
    func showSurveyUnavailableVC() {
        let vc = SurveyUnavailableVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

