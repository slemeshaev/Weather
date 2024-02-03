//
//  NetworkDataFetcher.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 03.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

final class NetworkDataFetcher {
    // MARK: - Interface
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> ()) {
        networkService.request(city: city) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: WeatherResponse.self, from: data)
            completion(decode)
        }
    }
    
    // MARK: - Private
    private var networkService = NetworkService()
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON \(jsonError)")
            return nil
        }
    }
}
