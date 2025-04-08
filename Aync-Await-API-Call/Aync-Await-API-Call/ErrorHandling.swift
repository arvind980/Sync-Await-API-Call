//
//  ErrorHandeling.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

enum APIError: Error {
    case invalidURL
    case noNetwork
    case invalidResponse
    case noData
    case decodingFailed
    case networkError(Error)
}
