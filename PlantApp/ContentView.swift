//
//  ContentView.swift
//  PlantApp
//
//  Created by Tasneem Awad on 29/05/1448 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
