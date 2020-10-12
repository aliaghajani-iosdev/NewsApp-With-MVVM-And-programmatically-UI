//
//  Webservice.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation

// api = 891489f69cdf4f38b248cdd10cde84bd

class Webservice {
//    static let shared = Webservice()
    func getNews(compelition: @escaping ([Article]?) -> ()) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=891489f69cdf4f38b248cdd10cde84bd")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    compelition(nil)
                } else if let data = data {
                    let news = try? JSONDecoder().decode(Articles.self, from: data)
                    if let news = news {
                        print(news.articles)
                        compelition(news.articles)
                    }
                }
            }
        }.resume()
    }
}
