//
//  AuthorizationService.swift
//  MusicAppClone
//
//  Created by temp_name on 9/3/24.
//

import RxCocoa
import RxSwift

enum AuthorizationError: Error {
    case invalidURL
    case failEncoded
    case emptyData
    case invalidResponse
}

protocol AuthorizationServiceType {
    func requestAuthorizationToken() -> Observable<AuthorizationResponseDTO>
}

struct AuthorizationService: AuthorizationServiceType {
    
    private let clientId: String = "aa65f3eabea94436b8af8c7cddb9052d"
    private let clientSecret: String = "b9f575f89967442fbd170b4a7ed4ffdd"
    
    func requestAuthorizationToken() -> Observable<AuthorizationResponseDTO> {
        guard let url = URL(string: "https://accounts.spotify.com/api/token") else {
            return Observable.error(AuthorizationError.invalidURL)
        }
        var request: URLRequest = URLRequest(url: url)
        let authorizationValue = Data((clientId + ":" + clientSecret).utf8).base64EncodedString()
        request.addValue(
            "Basic \(authorizationValue)",
            forHTTPHeaderField: "Authorization")
        request.addValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        var components: URLComponents = URLComponents()
        let queryItem = URLQueryItem(name: "grant_type", value: "client_credentials")
        components.queryItems = [queryItem]
        let encoded = components.percentEncodedQuery?.data(using: .utf8)
        request.httpBody = encoded
        
        return Observable.create { observer in
            URLSession.shared.dataTask(
                with: request) { data, response, error in
                    guard let data = data else {
                        return observer.onError(AuthorizationError.emptyData)
                    }
                    if let error = error {
                        return observer.onError(error)
                    }
                    do {
                        let decoder: JSONDecoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decoded = try JSONDecoder().decode(
                            AuthorizationResponseDTO.self,
                            from: data)
                        observer.onNext(decoded)
                    } catch {
                        observer.onError(error)
                    }
                }.resume()
            return Disposables.create()
        }
    }
}

struct StubAuthorizationService: AuthorizationServiceType {    
    func requestAuthorizationToken() -> Observable<AuthorizationResponseDTO> {
        return Observable.empty()
    }
}
