//
//  GameHelloModel.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 23.09.2022.
//

import Foundation
/// Модель принимающая текст и возвращающая hello, если пришло leoh
struct GameHelloModel {
    var param: String?
    
    func returnText(_ text: String?) -> String? {
        text == "leohl" ? "hello" : text
    }
}
