//
//  AdLocationDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdLocationDTOMapper {
    static func map(_ dto: AdLocationDTO) -> AdLocation {        
        return AdLocation(
            code: dto.code,
            key: dto.key,
            label: dto.label,
            locations: dto.locations?.map(map)
        )
    }
}
