import Foundation

public final class URLSessionProvider: NetworkService, RequestHandleResponsable {
    private let session: URLSession

    public init() {
        session = URLSession(configuration: URLSession.shared.configuration)
    }

    public func performRequest<T: Decodable>(
        endpoint: Endpoint,
        using keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        result: @escaping ResultHandler<T>
    ) {

        guard let request = URLRequest(endpoint: endpoint) else { preconditionFailure("Fail on create request") }

        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                let response = response as? HTTPURLResponse

                self.handleResponse(
                    data: data,
                    keyDecodingStrategy: keyDecodingStrategy,
                    response: response,
                    error: error,
                    result: result
                )
            }
        }
        task.resume()
    }
}
