//
//  TrafficLightNSLayoutAnchorViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 16.10.2022.
//

import UIKit

/// Светофор на StackView
final class TrafficLighStackViewViewController: UIViewController {
    
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
    
    private var trafficLightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        view.addSubview(trafficLightStackView)
        trafficLightStackView.addArrangedSubview(redView)
        trafficLightStackView.addArrangedSubview(yellowView)
        trafficLightStackView.addArrangedSubview(greenView)
    }
    
    // MARK: - Constrains
    
    private func configureLayoutAnchor() {
        trafficLightStackView.heightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.heightAnchor,
            multiplier: 0.8
        ).isActive = true
        
        trafficLightStackView.widthAnchor.constraint(
            equalTo: trafficLightStackView.heightAnchor,
            multiplier: 0.3
        ).isActive = true
        
        trafficLightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        trafficLightStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        trafficLightStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        trafficLightStackView.isLayoutMarginsRelativeArrangement = true
    }
}
