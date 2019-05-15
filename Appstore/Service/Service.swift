//
//  Service.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 17/04/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) ->()){
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) ->()){
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) ->()){
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData< T: Decodable >(urlString: String, completion: @escaping (T?, Error?) -> Void){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err{
                completion(nil, err)
            }
            do{
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
                
            }catch{
                print(error)
            }
            }.resume()
    }
}
