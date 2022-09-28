//
//  ButerInformation.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 26.09.2022.
//
import Foundation

/// Описывает данные покупателей
struct BuyerInformation: Codable {
    var name: String = ""
    var phoneNumber: String = ""
    var birthday: String = ""
    var login: String = ""
    var password: String = ""
}
