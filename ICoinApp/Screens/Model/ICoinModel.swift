//
//  ICoinModel.swift
//  ICoinApp
//
//  Created by Ram Naidu on 17/11/24.
//

import Foundation

struct Coin {
    let id: Int
    let name: String
    let mar_supply: Int?
    let cmc_rank: Int
    let quote: Quote
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id).png")
    }
    
    struct Quote {
        let CAD: CAD
        
        struct CAD {
            let price: Double
            let mark_cap: Double
        }
    }
}

extension Coin {
    public static func getMorkArray() -> [Coin] {
        return [
            Coin(id: 1, name: "Ramachandra", mar_supply: 200, cmc_rank: 1, quote: Quote(CAD: Quote.CAD(price: 5000.0, mark_cap: 10000.0))),
            Coin(id: 1, name: "Ramachandra", mar_supply: nil, cmc_rank: 1, quote: Quote(CAD: Quote.CAD(price: 5000.0, mark_cap: 10000.0))),
            Coin(id: 1, name: "Ramachandra", mar_supply: nil, cmc_rank: 1, quote: Quote(CAD: Quote.CAD(price: 5000.0, mark_cap: 10000.0)))
        ]
    }
}
