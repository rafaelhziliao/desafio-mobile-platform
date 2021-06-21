import Foundation

public enum NetworkError: Error {
    case custom(description: String)
    case unknown
    case parseError
    case noJSONData
    case noNetwork
    case requestTimeout
    case unauthorized
    case badRequest
    case outDated

    var localizedDescription: String {
        switch self {
        case let .custom(description):
            return description
        case .unknown, .parseError, .noJSONData, .badRequest, .outDated:
            return "Falha durante a conexão com o serviço"
        case .requestTimeout, .noNetwork:
            return "Por favor tente novamente"
        case .unauthorized:
            return "Dado(s) inválidos"
        }
    }

    public init(description: String) {
        self = .custom(description: description)
    }
}

extension NetworkError: Equatable {}
