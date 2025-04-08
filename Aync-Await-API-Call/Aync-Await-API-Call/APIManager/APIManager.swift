//
//  Untitled.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

import Foundation
import Network

class APIManager{
    static let shared = APIManager()
   
    private init() {}
    
    func getAPICall<T:Decodable>(urlString:String) async throws -> T{
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (Data,response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            throw APIError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: Data)
    }
}

