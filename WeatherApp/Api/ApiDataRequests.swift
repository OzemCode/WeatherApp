//
//  ApiDataRequests.swift
//  WeatherApp
//
//  Created by George Churikov on 06.01.2024.
//

import Foundation

protocol APIDataRequest {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
    var method: ApiHttpMethod { get }
}

enum Result<T> {
    case success(URLResponse?, T)
    case failure(URLResponse?, Error)
}

extension APIDataRequest {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method == .post || method == .put {
            if let body = self.body {
                request.httpBody = body.jsonData
            }
            
        }
        headers?.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }

    
    private var url: URL? {
        guard var urlComponents = URLComponents(string: baseURL + path) else { return nil }
        
        if let parameters = parameters, !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            urlComponents.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
           
        }
        
        return urlComponents.url
    }
}

