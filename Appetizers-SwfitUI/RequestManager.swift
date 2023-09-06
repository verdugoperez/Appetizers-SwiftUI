//
//  RequestManager.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import Foundation

class RequestManager {
    
    func makeNetworkRequest(url: URL) async throws -> Data {
        // Perform the network request asynchronously.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    
    func decodeData<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
}
