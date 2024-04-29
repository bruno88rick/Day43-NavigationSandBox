//
//  ContentView.swift
//  Day43-NavigationSandBox
//
//  Created by Bruno Oliveira on 26/04/24.
//

import SwiftUI

//class to save our navigation data

@Observable
class PathStore {
    var path: [Int] { // if you're using NavigationPath() -> var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                //if you're using NavigationPath() -> if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data){
                path = decoded
                //if you're using NavigationPath() -> path = NavigationPath(decoded)
                return
            }
        }
        //Still here? Start with an empty array
        path = []
        //if you're using NavigationPath() -> path = NavigationPath()
    }
    
    func save() {
        
        //if you're using NavigationPath() ->
        //guard let representation = path.codable else {return}
        
        do {
            let data = try JSONEncoder().encode(path)
            //if you're using NavigationPath() -> let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    
}

struct ContentView: View {

    @State private var path = [Int]()
    // if you're using NavigationPath() -> @State private var pathStore = PathStore()
    
    var body: some View {
        VStack {
            NavigationStack(path: $path){
                //if you're using NavigationPath() -> NavigationStack(path: $pathStore.path)
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
