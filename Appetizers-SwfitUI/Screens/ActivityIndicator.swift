//
//  ActivityIndicator.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 12/09/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let activityIndicatorView =  UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(Colors.brandPrimary)
        
        return activityIndicatorView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }

}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
