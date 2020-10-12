//
//  MainController.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation
import UIKit


class MainController: UIViewController {
    //MARK: - Properties
    
    let newscellIdentifier = "jbkjbjkjbkj"
    var articlesVM: ArticlesViewModel!
    
    lazy var mainTableView: UITableView = {
        let mt = UITableView()
        mt.rowHeight = UITableView.automaticDimension
        mt.estimatedRowHeight = 100
        mt.delegate = self
        mt.dataSource = self
        mt.register(NewsTableCell.self, forCellReuseIdentifier: newscellIdentifier)
        mt.backgroundColor = .white
        mt.translatesAutoresizingMaskIntoConstraints = false
        return mt
    }()
    
    
    
    
    //MARK: - Inits
    override func viewDidLoad() {
        super.viewDidLoad()
        Webservice().getNews { news in
            if let news = news {
                self.articlesVM = ArticlesViewModel(articles: news)
                self.mainTableView.reloadData()
            }
        }
        setupNavBar()
        setupConstraint()
    }
    
    
    //MARK: - seting up navBar
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "News List"
    }
    
    
    //MARK: - seting up constraint
    func setupConstraint() {
        view.addSubview(mainTableView)
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}


extension MainController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlesVM == nil ? 0 : self.articlesVM.numberOfsection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesVM.numberOfRowInsection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newscellIdentifier) as? NewsTableCell else {
            fatalError("Probably something's wrong with NewstableCell or its Identifier")
        }
        let articleVM = self.articlesVM.articleAtIndex(indexPath.row)
        cell.articleVM = articleVM
        return cell
    }
    
    
}
