import Foundation

public protocol TreatJSONDecode {
    func treatJSONDecode<T: Decodable>(data: Data, result: ResultHandler<T>)
    func decoded<T: Decodable>(_ data: Data, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) throws -> T
}

public extension TreatJSONDecode {
    func decoded<T: Decodable>(
        _ data: Data,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
    ) throws -> T {
        let decoder: JSONDecoder = .init()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        return try decoder.decode(T.self, from: data)
    }
        
    func treatJSONDecode<T: Decodable>(data: Data, result: ResultHandler<T>) {
        do {
            let decodedData =  try decoded(data) as T
            result(.success(decodedData))
        } catch DecodingError.keyNotFound(let key, let context) {
            let description = """
                Failed to decode missing key '\(key.stringValue)'
                not found – \(context.debugDescription)
            """
            result(.failure(NetworkError(description: description)))
        } catch DecodingError.typeMismatch(_, let context) {
            let description = "Failed to decode to type mismatch – \(context.debugDescription)"
            result(.failure(NetworkError(description: description)))
        } catch DecodingError.valueNotFound(let type, let context) {
            let descritpion = "Failed to decode to missing \(type) value – \(context.debugDescription)"
            result(.failure(NetworkError(description: descritpion)))
        } catch DecodingError.dataCorrupted(_) {
            result(.failure(.noJSONData))
        } catch {
            result(.failure(.parseError))
        }
    }
}
