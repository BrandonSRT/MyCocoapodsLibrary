//
//  Api.swift
//  MyCocoapodsLibrary
//
//  Created by user203110 on 9/25/21.
//

import Foundation

class Api{

    init(){}
    
    func loadData(completion:Array<PsychoFact>?) -> Array<PsychoFact> {
        var results = [PsychoFact]()
        guard let url = URL(string: "https://psychonauts-api.herokuapp.com/api/characters?limit=5") else {
            print("Your API end point is Invalid")
            return results
        }
    let request = URLRequest(url: url)
    // The shared singleton session object.
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode([PsychoFact].self, from: data) {
                DispatchQueue.main.async {
                    results = response
                }
                return
            }

        }
        
    }.resume()
        return results

    }
}
