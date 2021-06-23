//
//  AdDetail.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdDetail {
    let subject: String
    let thumbnail: AdThumbnail?
    let prices: [AdPrice]?
    let locations: [AdLocationDTO]
    let listTime: AdListTime
}
