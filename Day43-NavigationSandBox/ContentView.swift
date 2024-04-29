//
//  ContentView.swift
//  Day43-NavigationSandBox
//
//  Created by Bruno Oliveira on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        VStack {
            NavigationStack(path: $path){
                DetailView(number: 0, path: $path)
                    .navigationDestination(for: Int.self) { i in
                        DetailView(number: i, path: $path)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
