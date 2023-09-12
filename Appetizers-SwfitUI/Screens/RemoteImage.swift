//
//  RemoteImage.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 12/09/23.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    @MainActor func load(fromURLString: String) async {
        do {
            guard let uiImage = try await NetworkManager().downloadImage(fromURLString: fromURLString) else {
                image = nil
                return
            }
            
            image = Image(uiImage: uiImage)
        } catch {
            print(error.localizedDescription)
        }
    }
}


struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Images.foodPlaceholder.resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image).onAppear {
            Task {
                await imageLoader.load(fromURLString: urlString)
            }
        }
    }
}
