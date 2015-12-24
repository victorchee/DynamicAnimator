//
//  PositiontoBoundsMapping.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

protocol ResizableDynamicItem: UIDynamicItem {
    var bounds: CGRect { get set}
}

extension UIView: ResizableDynamicItem {}

class PositiontoBoundsMapping: NSObject {
    var target: ResizableDynamicItem!
    
    convenience init(target: ResizableDynamicItem) {
        self.init()
        self.target = target
    }
}

extension PositiontoBoundsMapping: UIDynamicItem {
    var bounds: CGRect {
        set {
            target.bounds = newValue
        }
        
        get {
            return target.bounds
        }
    }
    
    var center: CGPoint {
        set {
            target.bounds = CGRect(x: 0, y: 0, width: newValue.x, height: newValue.y)
        }
        
        get {
            return CGPoint(x: target.bounds.width, y: target.bounds.height)
        }
    }
    
    var transform: CGAffineTransform {
        set {
            target.transform = newValue
        }
        
        get {
            return target.transform
        }
    }
}
