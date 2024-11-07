//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MenuView(viewModel: .init())
    }
}

#Preview {
    ContentView()
}
