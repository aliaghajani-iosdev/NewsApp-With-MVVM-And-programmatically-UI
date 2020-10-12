//
//  NewsTableCell.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation
import UIKit
import Kingfisher

class NewsTableCell: UITableViewCell {
    //MARK: - Properties
    
    var articleVM: ArticleViewModel? {
        didSet {
            guard let articleVMTitle = articleVM?.title else {
                return titleLbl.text = ""
            }
            guard let articleVMDescription = articleVM?.decription else {
                return descriptionLbl.text = ""
            }
            guard let articleVMImageLink = articleVM?.imageLink else {
                return newsImage.image = UIImage(named: "")
            }
            let url = URL(string: articleVMImageLink)!
            titleLbl.text = articleVMTitle
            descriptionLbl.text = articleVMDescription
            newsImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil)
        }
    }
    
    lazy var gradeientView: GradientView = {
        let v = GradientView()
        v.gradientLayer.gradient = (start: CGPoint(x: 0.5, y: 1), end: (CGPoint(x: 0.5, y: 0)))
        v.gradientLayer.colors = [ UIColor(white: 1, alpha: 1).cgColor, UIColor(white: 1, alpha: 0).cgColor ]
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let titleLbl: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .left
        tl.numberOfLines = 2
        tl.adjustsFontSizeToFitWidth = true
        tl.font = UIFont.boldSystemFont(ofSize: 14)
        tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()
    
    
    let descriptionLbl: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .left
        tl.numberOfLines = 0
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()
    
    let newsImage: UIImageView = {
        let nm = UIImageView()
        nm.contentMode = .scaleAspectFit
        nm.translatesAutoresizingMaskIntoConstraints = false
        return nm
    }()
    
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - seting up constraint for UI elements
    fileprivate func setupConstraint() {
        addSubview(newsImage)
        newsImage.addSubview(gradeientView)
        newsImage.addSubview(titleLbl)
        addSubview(descriptionLbl)
        
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 100),
            newsImage.rightAnchor.constraint(equalTo: rightAnchor),
            newsImage.leftAnchor.constraint(equalTo: leftAnchor),
            
            gradeientView.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor),
            gradeientView.leftAnchor.constraint(equalTo: newsImage.leftAnchor),
            gradeientView.rightAnchor.constraint(equalTo: newsImage.rightAnchor),
            gradeientView.heightAnchor.constraint(equalTo: newsImage.heightAnchor, multiplier: 0.8),
            
            titleLbl.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: -4),
            titleLbl.leftAnchor.constraint(equalTo: newsImage.leftAnchor, constant: 12),
            titleLbl.rightAnchor.constraint(equalTo: newsImage.rightAnchor, constant: -38),
            titleLbl.heightAnchor.constraint(equalTo: newsImage.heightAnchor, multiplier: 0.3),
            
            descriptionLbl.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 4),
            descriptionLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            descriptionLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            descriptionLbl.bottomAnchor.constraint(equalTo: bottomAnchor),
           
        ])

    }
    
    
    
    
}
