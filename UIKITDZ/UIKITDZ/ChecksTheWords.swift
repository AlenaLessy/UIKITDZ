//
//  GameHelloModel.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 23.09.2022.
//

import Foundation
/// Принимает , буквы, возвращает слово
struct ChecksTheWords {
    var param: String?
    
    func returnText(_ text: String?) -> String? {
        text == "leohl" ? "hello" : text
    }
}
