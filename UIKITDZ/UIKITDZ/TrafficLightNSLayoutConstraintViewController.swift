//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Светофор на NSLayoutConstraint
final class TrafficLightNSLayoutConstraintViewController: UIViewController {
    
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
        configureLayout()
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.backgroundColor = .systemBackground
        let views = [blackView, redView, yellowView, greenView]
        views.forEach { view.addSubview($0) }
    }
    
    // MARK: - Constrains
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: redView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .top,
                               multiplier: 1,
                               constant: 30),
            
            NSLayoutConstraint(item: redView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .height,
                               multiplier: 0.25, constant: 0),
            
            NSLayoutConstraint(item: redView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: redView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: yellowView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 5),
            
            NSLayoutConstraint(item: yellowView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .width,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: yellowView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: yellowView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: greenView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 5),
            
            NSLayoutConstraint(item: greenView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .width,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: greenView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: greenView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: greenView,
                               attribute: .centerX,
                               relatedBy: .lessThanOrEqual,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 250),
            
            NSLayoutConstraint(item: blackView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .top,
                               multiplier: 1,
                               constant: -10),
            
            NSLayoutConstraint(item: blackView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: greenView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 10),
            
            NSLayoutConstraint(item: blackView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .leading,
                               multiplier: 1,
                               constant: -5),
            
            NSLayoutConstraint(item: blackView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 5),
        ])
    }
}
