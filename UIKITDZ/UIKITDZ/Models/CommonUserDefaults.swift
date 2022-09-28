//
//  CommonUserDefaults.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 27.09.2022.
//

import Foundation

/// Установка и чтение информации о покупателях и сохранение значений в массив
struct CommonUserDefaults {
    private init() {}
 
    private enum Keys: String {
        case buyers
    }

    static var buyers: [BuyerInformation] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.buyers.rawValue) else { return [] }
            return (try? PropertyListDecoder().decode([BuyerInformation].self, from: data)) ?? []
        }
        set {
            let data = try? PropertyListEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: Keys.buyers.rawValue)
        }
    }
    
    static func addBuyer(_ buyer: BuyerInformation) {
        var buyers = Self.buyers
        buyers.append(buyer)
        Self.buyers = buyers
    }
}
