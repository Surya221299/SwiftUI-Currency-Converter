//
//  CurrencyAPI.swift
//  Currency Converter
//
//  Created by Bamantara S on 26/07/23.
//

import SwiftUI

struct CurrencyAPI: Codable {
    let rates: [String: Double]
}

enum CoinError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

