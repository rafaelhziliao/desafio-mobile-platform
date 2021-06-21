//
//  ListAdsDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct ListAdsDTOMapper {
    static func map(_ dto: ListAdsDTO) -> ListAds {
        let ads: [Ad]? = dto.listAds?.map{ Ad(ad: AdDetailDTOMapper.map($0.ad)) }
        return ListAds(listAds: ads)
    }
}
