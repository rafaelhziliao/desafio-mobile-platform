//
//  AdDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdDTOMapper {
    static func map(_ dto: AdDTO) -> Ads {
        return Ads(adDetail: AdDetailDTOMapper.map(dto.adDetail))
    }
}
