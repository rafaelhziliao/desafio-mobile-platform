//
//  AdPriceDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdPriceDTOMapper {
    static func map(_ dto: AdPriceDTO) -> AdPrice {
        return AdPrice(label: dto.label, priceValue: dto.priceValue)
    }
}
