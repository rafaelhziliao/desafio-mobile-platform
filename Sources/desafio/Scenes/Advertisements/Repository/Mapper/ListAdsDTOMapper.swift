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
        let ads: [Ads]? = dto.listAds?.map { Ads(adDetail: AdDetailDTOMapper.map($0.adDetail)) }
        return ListAds(listAds: ads)
    }
}
