//
//  GravityViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/23/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    @IBOutlet weak var itemView: UIView!
    var animator: UIDynamicAnimator!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravityBeahvior = UIGravityBehavior(items: [itemView])
        animator.addBehavior(gravityBeahvior)
    }
}
