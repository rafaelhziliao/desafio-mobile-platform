import Foundation

public typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void
             
public protocol NetworkService {
    func performRequest<T: Decodable>(endpoint: Endpoint, result: @escaping ResultHandler<T>)
}
