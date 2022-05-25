//
//  APICaller.swift
//  Netflix-clone
//
//  Created by Utkarsh Upadhyay on 20/05/22.
//

import Foundation


struct Constants {
    static let APIKey = "eddd42e2c1d74938ea873ed0b8bd52c7"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_Key = "AIzaSyBKox_GZp_0ln7MsnAAEyEczgHg-zf602I"
    static let YoutubeBaseURl = "https://youtube.googleapis.com/youtube/v3/search?"
    
}

class APICaller {
    static let shared = APICaller()
    
    enum APIerror: Error {
        case failedToGetData
    }
     
    func getTrendinMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.APIKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.APIKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.APIKey)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinTitleResponse.self, from: data)
                print (results)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        print(query)
        guard let url = URL(string: "\(Constants.YoutubeBaseURl)q=\(query)&key=\(Constants.YoutubeAPI_Key)")
       
        else {return}
        print (url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }

            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                print(results)
                completion(.success(results.items[0]))
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(APIerror.failedToGetData))
            }
            
        }
        task.resume()
        
    }

}

// JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
//print (results) JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                completion(.success(results.items[0]))
