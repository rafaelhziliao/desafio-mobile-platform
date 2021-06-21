//
//  Endpoint+Defaults.swift
//  desafio
//
//  Created by rafael zilao on 20/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation
import NetworkLayer

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "nga.olx.com.br"
    }
}
