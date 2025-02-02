import Foundation

public protocol RequestHandleResponsable: TreatDataResponse {
    func handleResponse<T: Decodable>(
        data: Data?,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
        response: HTTPURLResponse?,
        error: Error?,
        result: ResultHandler<T>
    )
}

public extension RequestHandleResponsable {
    func handleResponse<T: Decodable>(
        data: Data?,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
        response: HTTPURLResponse?,
        error: Error?,
        result: ResultHandler<T>
    ) {

        if let error = error {
            return result(.failure(NetworkError(description: error.localizedDescription)))
        }

        guard let response = response,
              let data = data
        else {
            return result(.failure(.noJSONData))
        }

        treatDataResponse(
            data: data,
            keyDecodingStrategy: keyDecodingStrategy,
            response: response,
            result: result
        )
    }

}
