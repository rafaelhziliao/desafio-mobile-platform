//
//  AdDetailDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdDetailDTOMapper {
    static func map(_ dto: AdDetailDTO) -> AdDetail {
        let prices: [AdPrice]? = dto.prices?.map { AdPrice(label: $0.label, priceValue: $0.priceValue) }
        return AdDetail(
            subject: dto.subject,
            thumbnail: AdThumbnailDTOMapper.map(dto.thumbnail),
            prices: prices,
            locations: dto.locations,
            listTime: AdListTimeDTOMapper.map(dto.listTime)
        )
    }
}
