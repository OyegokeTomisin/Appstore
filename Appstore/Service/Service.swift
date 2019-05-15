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
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion([], err)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                completion([], jsonErr)
            }
            }.resume()
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) ->()){
        //let url = https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) ->()){
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) ->()){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err{
                completion(nil, err)
            }
            do{
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
                
            }catch{
                print(error)
            }
            }.resume()
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err{
                completion(nil, err)
            }
            do{
                let appGroup = try JSONDecoder().decode([SocialApp].self, from: data!)
                completion(appGroup, nil)
                
            }catch{
                print(error)
            }
            }.resume()
    }
}
