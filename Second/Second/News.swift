//
//  News.swift
//  Second
//
//  Created by Jesse Ruiz on 10/13/20.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class News {
    var url: URL
    var stories = ""
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(using session: URLSession = .shared,
               completionHandler: @escaping () -> Void) {
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }
            completionHandler()
        }
        task.resume()
    }
}

extension URLSession: URLSessionProtocol { }
