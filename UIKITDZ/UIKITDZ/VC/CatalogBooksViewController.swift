//
//  CatalogBooksViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 05.10.2022.
//

import UIKit
/// Экран каталога книг и покупки
class CatalogBooksViewController: UIViewController {
    @IBOutlet weak var bookSegmentControl: UISegmentedControl!
    @IBOutlet weak var bookImage: UIImageView!
    private var images = [UIImage(named: "nastavnik"),
                                   UIImage(named: "tyma"),
                                   UIImage(named: "prepatch"),
                                   UIImage(named: "sled"),
    UIImage(named: "sled")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func booksSegmentControlAction(_ sender: UISegmentedControl) {
        guard sender == bookSegmentControl else { return }
                bookSegmentControl.addTarget(self, action: #selector(memSegmenrControlImageAction), for: .valueChanged)
    }
    
    @objc private func memSegmenrControlImageAction() {
            let segmentIndex = bookSegmentControl.selectedSegmentIndex
            bookImage.image = images[segmentIndex]
        }
}
