//
//  Company.swift
//  TradeCoin
//
//  Created by Kechun Mao on 6/28/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit

struct Company: Decodable {
    let symbol: String
    let companyName: String
    let latestPrice: Double
    let change: Double
    let changePercent: Double
}
