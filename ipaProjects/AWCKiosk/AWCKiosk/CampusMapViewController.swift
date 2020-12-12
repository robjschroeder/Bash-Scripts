//
//  CampusMapViewController.swift
//  AWCKiosk
//
//  Created by Robert J Schroeder on 8/20/19.
//  Copyright © 2019 Arizona Western College. All rights reserved.


import UIKit

class CampusMapViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // scrollView.delegate = self - it is set on the storyboard.
        imgImage.isUserInteractionEnabled = true

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        imgImage.addGestureRecognizer(pinchGesture)
    }

    @objc func pinchGesture(sender:UIPinchGestureRecognizer) {
        sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        if sender.state == .ended {
            self.imgImage.transform = CGAffineTransform.identity
        }
        
    }

}
