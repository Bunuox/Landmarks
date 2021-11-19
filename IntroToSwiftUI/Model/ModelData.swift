//
//  ModelData.swift.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 18.11.2021.
//

import Foundation

final class ModelData: ObservableObject{
    //An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T:Decodable>(_ filename: String) -> T{
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("File could not find")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Data could not read")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Error decoding JSON data")
    }
}
