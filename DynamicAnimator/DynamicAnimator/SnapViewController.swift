//
//  SnapViewController.swift
//  DynamicAnimator
//
//  Created by qihaijun on 12/24/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {
    @IBOutlet weak var itemView: UIView!
    
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animator = UIDynamicAnimator(referenceView: view)
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        
        if let snap = snapBehavior {
            animator.removeBehavior(snap)
        }
        
        snapBehavior = UISnapBehavior(item: itemView, snapTo: point)
        animator.addBehavior(snapBehavior!)
    }
}
