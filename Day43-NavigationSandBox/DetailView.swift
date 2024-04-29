//
//  DetailView.swift
//  Day43-NavigationSandBox
//
//  Created by Bruno Oliveira on 26/04/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    //Using @Binding to get access on the path on ContentView
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to number", value: Int.random(in: 0..<1000))
            .navigationTitle("Number \(number)")
        
            .toolbar {
                Button("Home"){
                    path.removeAll()
                    /*If we're using NavigationPath() instead of an array of Ints (path = [Int])  we can do:*/
                    //path = NavigationPath()
                }
            }
    }
}

/*#Preview {
    DetailView(number: 5, path:)
}*/
