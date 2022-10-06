//
//  CommonUserDefaults.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 05.10.2022.
//

import Foundation
/// Установка и чтение параметров и добавление пользователей в UserDefaults
 struct CommonUserDefaults {
     private enum Keys: String {
         case users
     }

     static var users: [UserInfo] {
         get {
             guard let data = UserDefaults.standard.data(forKey: Keys.users.rawValue) else { return [] }
             return (try? PropertyListDecoder().decode([UserInfo].self, from: data)) ?? []
         }
         set {
             let data = try? PropertyListEncoder().encode(newValue)
             UserDefaults.standard.set(data, forKey: Keys.users.rawValue)
         }
     }
     
     private init() {}

     static func addUser(_ user: UserInfo) {
         var users = Self.users
         users.append(user)
         Self.users = users
        }
    }
