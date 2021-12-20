//
//  APIService.swift
//  mvvm-swift-ios
//
//  Created by Hantash on 16/12/2021.
//

import Foundation

class APIService: NSObject {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    //Created a function with completion
    func requestGetEmployee(completion : @escaping ([Employee]) -> ()){
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let employees = try! jsonDecoder.decode([Employee].self, from: data)
                completion(employees)
            }
        
        }.resume()
    }
}
