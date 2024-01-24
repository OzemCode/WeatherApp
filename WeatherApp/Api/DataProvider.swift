//
//  DataProvider.swift
//  WeatherApp
//
//  Created by George Churikov on 06.01.2024.
//

import Foundation

class APIDataProvider<T: APIDataRequest> {
    
    var urlSession = URLSession.shared

    init() { }
    
    
    func loadData(service: T, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data>) -> Void) {
        
        urlSession.dataTask(with: service.urlRequest) { (data, response, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(response, error))
                }
            } else if let data = data {
                deliverQueue.async {
                    completion(.success(response, data))
                }
            } else {
                deliverQueue.async {
                    completion(.failure(response, NSError()))
                }
            }
        }.resume()
    }
    
    func loadJson<U: Decodable>(request: T, decodeType: U.Type, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<U>) -> Void) {
        let urlRequest = request.urlRequest

        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(response, error))
                }
            } else if let data = data {
                deliverQueue.async {
                    let decoder = JSONDecoder()
                    do {
                        let json = try decoder.decode(decodeType, from: data)
                        completion(.success(response, json))
                    }
                    catch {
                        completion(.failure(response, error))
                    }
                }
            } else {
                deliverQueue.async {
                    completion(.failure(response, NSError()))
                }
            }
        }.resume()
    }
}
