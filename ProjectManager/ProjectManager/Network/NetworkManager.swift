//
//  NetworkManager.swift
//  ProjectManager
//
//  Created by 오인탁 on 2021/07/30.
//

import Foundation

enum ServerAPI {
    static let baseURL = "https://projectmanager-great.herokuapp.com/tasks"
    
    case create
    case read
    case update(id: String)
    case delete(id: String)

    var url: URL? {
        switch self {
        case .create:
            return URL(string: Self.baseURL)
        case .read:
            return URL(string: Self.baseURL)
        case .update(let id):
            return URL(string: Self.baseURL + "/" + id)
        case .delete(let id):
            return URL(string: Self.baseURL + "/" + id)
        }
    }
}

class NetworkManager {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(url: URL, completion: @escaping (Result<[Task], Error>) -> Void) {
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                completion(.failure(fatalError()))
                return
            }
            
            if let data = data,
               let tasks = try? JSONDecoder().decode([Task].self, from: data) {
                completion(.success(tasks))
                return
            }
            completion(.failure(fatalError()))
        }
        dataTask.resume()
    }
}
