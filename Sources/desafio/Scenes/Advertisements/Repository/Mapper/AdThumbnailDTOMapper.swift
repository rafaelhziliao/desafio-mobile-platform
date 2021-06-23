//
//  AdThumbnailDTOMapper.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdThumbnailDTOMapper {
    static func map(_ dto: AdThumbnailDTO?) -> AdThumbnail? {
        guard let dto = dto else { return nil }

        return AdThumbnail(
            height: dto.height,
            width: dto.width,
            path: dto.path,
            baseUrl: dto.baseUrl,
            mediaId: dto.mediaId
        )
    }
}
