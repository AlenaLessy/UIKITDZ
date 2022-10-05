//
//  CatalogBooksViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 05.10.2022.
//

import UIKit
/// Экран каталога книг и покупки
final class CatalogBooksViewController: UIViewController {
    // Private Outlets
    @IBOutlet weak private var bookSegmentControl: UISegmentedControl!
    @IBOutlet weak private var bookImage: UIImageView!
    
    // Private properties
    private var images = [UIImage(named: "nastavnik"),
                                   UIImage(named: "tyma"),
                                   UIImage(named: "prepatch"),
                                   UIImage(named: "sled"),
    UIImage(named: "sled")]
    
    // LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Private Action
    @IBAction func booksSegmentControlAction(_ sender: UISegmentedControl) {
        guard sender == bookSegmentControl else { return }
                bookSegmentControl.addTarget(self, action: #selector(memSegmenrControlImageAction), for: .valueChanged)
    }
    
    @objc private func memSegmenrControlImageAction() {
            let segmentIndex = bookSegmentControl.selectedSegmentIndex
            bookImage.image = images[segmentIndex]
        }
}
