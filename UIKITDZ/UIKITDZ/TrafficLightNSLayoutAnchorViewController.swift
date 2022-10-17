//
//  TrafficLightNSLayoutAnchorViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 16.10.2022.
//

import UIKit

/// Светофор на NSLayoutAnchor
final class TrafficLightNSLayoutAnchorViewController: UIViewController {

    // MARK: - Private Visual Components
    private var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureLayoutAnchor()
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.backgroundColor = .systemBackground
        let views = [blackView, redView, yellowView, greenView]
        views.forEach { view.addSubview($0) }
    }
    
    // MARK: - Constrains
    
    private func configureLayoutAnchor() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            redView.widthAnchor.constraint(equalTo: redView.heightAnchor),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 5),
            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor),
            yellowView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 5),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor),
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            
            blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10),
            blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10),
            blackView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -5),
            blackView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 5)
        ])
    }
}
