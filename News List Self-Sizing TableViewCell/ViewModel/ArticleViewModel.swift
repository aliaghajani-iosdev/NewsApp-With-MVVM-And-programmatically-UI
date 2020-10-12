//
//  ArticleViewModel.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var title: String? {
        return article.title
    }
    
    var decription: String? {
        return article.description
    }
    
    var imageLink: String? {
        return article.urlToImage
    }
    
    
    
    
}





extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
