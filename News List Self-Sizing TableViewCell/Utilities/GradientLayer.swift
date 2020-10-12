//
//  GradientLayer.swift
//  News List Self-Sizing TableViewCell
//
//  Created by Ali Aghajani on 10/12/20.
//

import Foundation
import UIKit

class GradientLayer: CAGradientLayer {
    var gradient: (start: CGPoint, end: CGPoint)? {
        didSet {
            startPoint = gradient?.start ?? CGPoint.zero
            endPoint    = gradient?.end ?? CGPoint.zero
        }
    }
}

class GradientView: UIView {
    override public class var layerClass: Swift.AnyClass {
        return GradientLayer.self
    }
}

protocol GradientViewProvider {
    associatedtype GradientViewType
}

extension GradientViewProvider where Self: UIView {
    var gradientLayer: Self.GradientViewType {
    return layer as! Self.GradientViewType
    }
}


extension UIView: GradientViewProvider {
    typealias GradientViewType = GradientLayer
}
