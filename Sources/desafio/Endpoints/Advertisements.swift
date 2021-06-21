import Foundation
import NetworkLayer

struct Advertisements: Endpoint {
    var path: String { "/api/v1.2/public/ads" }
    var method: HttpMethod { .get }
    var header: Header? { nil }
    var parameters: Parameters? {
        ["lim" : limit,
         "region": region,
         "sort": sort,
         "state": state,
         "lang": language
        ]
    }
    var body: Body? { nil }
    
    var limit: String = ""
    var region: String = ""
    var sort: String = ""
    var state: String = ""
    var language: String = ""
}
