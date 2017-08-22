//
//  Networking.swift
//  nycTrees
//
//  Created by Mason Macias on 8/22/17.
//  Copyright © 2017 griffinmacias. All rights reserved.
//

import Foundation

final class Network {
    
    private init() { }
    
    static let shared = Network()
    
    public class func fetchAllTrees(completion: @escaping(Any?, Error?) -> Void) {
        if let url = URL(string: "https://data.cityofnewyork.us/resource/nwxe-4ae8.json") {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print("Error has occurred \(error.debugDescription)")
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    print("Data is empty")
                    completion(nil, error)
                    return
                }
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                completion(json, error)
            })
            task.resume()
        }
    }
}
