//
//  Ad.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import Foundation

struct ListAds: Decodable {
    let listAds: [Ad]?
}

struct Ad: Decodable {
    let ad: AdDetail
}

struct AdDetail: Decodable {
    let subject: String
    let thumbnail: AdThumbnail?
    let prices: [AdPrice]?
    let locations: [AdLocation]
    let listTime: AdListTime
}

struct AdThumbnail: Decodable {
    let height: Int
    let width: Int
    let path: String
    let baseUrl: String
    let mediaId: String
}

struct AdPrice: Decodable {
    let label: String
    let priceValue: Int
}

struct AdLocation: Decodable {
    let code: String?
    let key: String?
    let label: String?
    let locations: [AdLocation]?
}

struct AdListTime: Decodable {
    let label: String
    let value: Int
}
