//
//  NetworkService.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 02.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

class NetworkService {
    // MARK: - Interface
    func request(city: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = prepareParameters(city: city)
        let url = url(params: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    // MARK: - Private
    private func prepareParameters(city: String) -> [String: String] {
        var parameters = [String: String]()
        parameters["q"] = city
        parameters["units"] = "metric"
        parameters["appid"] = WeatherAPI.apiKey
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = WeatherAPI.scheme
        components.host = WeatherAPI.host
        components.path = WeatherAPI.path
        
        components.queryItems = params.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error received retrieving data: \(error.localizedDescription)")
                    completion(nil, error)
                }
                completion(data, error)
            }
        }
    }
}
