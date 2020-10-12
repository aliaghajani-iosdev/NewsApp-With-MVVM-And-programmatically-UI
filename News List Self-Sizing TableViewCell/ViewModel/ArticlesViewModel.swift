//
//  ArticlesViewMode.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation

struct ArticlesViewModel {
    var articles: [Article]
    
    
    var numberOfsection: Int {
        return 1
    }
    
    func numberOfRowInsection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}
