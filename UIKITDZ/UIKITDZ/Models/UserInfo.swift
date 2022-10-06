//
//  User.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 05.10.2022.
//

import Foundation
// Данные пользователей
 struct UserInfo: Codable {
     var login: String = ""
     var password: String = ""
     var name: String = ""
     var eMail: String = ""
     var phoneNumber: String = ""
 }
