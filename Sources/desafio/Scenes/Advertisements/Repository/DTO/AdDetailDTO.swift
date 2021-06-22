//
//  AdDetailDTO.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdDetailDTO: Decodable {
    let subject: String
    let thumbnail: AdThumbnailDTO?
    let prices: [AdPriceDTO]?
    let locations: [AdLocationDTO]
    let listTime: AdListTimeDTO
}
