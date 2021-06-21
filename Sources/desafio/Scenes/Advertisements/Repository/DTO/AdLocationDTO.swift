//
//  AdLocationDTO.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

struct AdLocationDTO: Decodable {
    let code: String?
    let key: String?
    let label: String?
    let locations: [AdLocationDTO]?
}
