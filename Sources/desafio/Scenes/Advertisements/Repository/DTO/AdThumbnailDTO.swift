//
//  AdThumbnailDTO.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdThumbnailDTO: Decodable {
    let height: Int
    let width: Int
    let path: String
    let baseUrl: String
    let mediaId: String
}
