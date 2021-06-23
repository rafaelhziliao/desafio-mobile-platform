//
//  AdListTimeDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdListTimeDTOMapper {
    static func map(_ dto: AdListTimeDTO) -> AdListTime {
        return AdListTime(label: dto.label, value: dto.value)
    }
}
