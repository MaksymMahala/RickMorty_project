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

struct ResultEpisode: Codable{
    var results: [Episode]
}
struct Episode: Codable{
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
struct ResultLocation: Codable{
    var results: [LocationUser]
}
struct LocationUser: Codable{
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}
class ResponseAPI{
    var model = [Model]()
    var episode = [Episode]()
    static let instance = ResponseAPI()

    func loadAPI(for page: Int, completition: @escaping ([Model]) -> Void){
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)")!
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(ResultModel.self, from: data!)
                        completition(jsonData.results)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    func loadAPIEpisode(completition: @escaping ([Episode]) -> Void){
        let url = URL(string: "https://rickandmortyapi.com/api/episode")!
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(ResultEpisode.self, from: data!)
                        completition(jsonData.results)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    func loadAPILocation(completition: @escaping ([LocationUser]) -> Void){
        let url = URL(string: "https://rickandmortyapi.com/api/location")!
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(ResultLocation.self, from: data!)
                        completition(jsonData.results)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
   
}

    
