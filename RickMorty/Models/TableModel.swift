//
//  TableModel.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//
import UIKit
import Foundation
import Alamofire

struct ResultModel: Codable{
    var results: [Model]
}
struct Model: Codable{
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}
struct Origin: Codable{
    var name: String
    var url: String
}
struct Location: Codable{
    var name: String
    var url: String
}

class ResponseAPI{
    var model = [Model]()

    
    func loadAPI(completition: @escaping ([Model]) -> Void){
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(ResultModel.self, from: data!)
                        completition(jsonData.results)
                        print(self.model)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
   
}

    
