//
//  News.swift
//  Second
//
//  Created by Jesse Ruiz on 10/13/20.
//

import Foundation

class News {
    var url: URL
    var stories = ""
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(completionHandler: @escaping () -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }
            completionHandler()
        }
        task.resume()
    }
}
