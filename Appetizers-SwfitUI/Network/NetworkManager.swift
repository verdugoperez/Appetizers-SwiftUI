//
//  NetworkManager.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 08/09/23.
//

import UIKit

enum APError: String, Error {
    case invalidURL = "La url no es válida"
    case invalidResponse = "La respuesta no es válida"
    case invalidData = "Data inválida"
}

class NetworkManager {
    static let shared = NetworkManager()
    private let requestManager: RequestManager
    private let cache = NSCache<NSString, UIImage>()
    
    private init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    convenience init() {
        self.init(requestManager: RequestManager())
    }
    
    func getAppetizersAsync() async throws -> [Appetizer] {
        guard let url = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers") else {
            throw APError.invalidURL
        }
        
        do {
            let data = try await requestManager.makeNetworkRequest(url: url)
            let requestAppetizer = try requestManager.decodeData(RequestAppetizer.self, from: data)
            return requestAppetizer.request
        } catch {
            throw error
        }
    }
    
    
    func downloadImage(fromURLString: String) async throws -> UIImage? {
        let cacheKey = NSString(string: fromURLString)
        
        if let image = cache.object(forKey: cacheKey){
            return image
        }
        
        guard let url = URL(string: fromURLString) else {
            throw APError.invalidURL
        }
        
        do {
            let data = try await requestManager.makeNetworkRequest(url: url)
            guard let image = UIImage(data: data) else {
                throw APError.invalidResponse
            }
            
            cache.setObject(image, forKey: cacheKey)
            
            return image
        } catch {
            throw error
        }
        
    }
}

