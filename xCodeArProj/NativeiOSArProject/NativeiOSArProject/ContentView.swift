//
//  ContentView.swift
//  NativeiOSArProject
//
//  Created by Khaled Alsuwaidi on 20/01/2025.
//

import SwiftUI
import PokeMonARframework
struct ContentView: View {
    @State private var showARView = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button(action: {
                showARView = true
            }) {
                Text("Open AR View")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .fullScreenCover(isPresented: $showARView) {
                ARViewControllerWrapper()
            }
        }
        .padding()
    }
}


struct ARViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARPokemonViewController {
        return ARPokemonViewController()
    }

    func updateUIViewController(_ uiViewController: ARPokemonViewController, context: Context) {

    }
}

#Preview {
    ContentView()
}
