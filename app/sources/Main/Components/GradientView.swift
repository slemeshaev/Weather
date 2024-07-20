//
//  GradientView.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 15.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class GradientView: UIView {
    // MARK: - Properties
    @IBInspectable var startColor: UIColor = Color.GradientPrimary.startColor {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var endColor: UIColor = Color.GradientPrimary.endColor {
        didSet {
            updateColors()
        }
    }
    
    var startLocation: CGFloat = 0 {
        didSet {
            updateLocations()
        }
    }
    
    var endLocation: CGFloat = 1 {
        didSet {
            updateLocations()
        }
    }
    
    var startPoint: CGPoint = .zero {
        didSet {
            updateStartPoint()
        }
    }
    
    var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            updateEndPoint()
        }
    }
    
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // MARK: - private
    private func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    
    private func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    private func updateStartPoint() {
        gradientLayer.startPoint = startPoint
    }
    
    private func updateEndPoint() {
        gradientLayer.endPoint = endPoint
    }
}
