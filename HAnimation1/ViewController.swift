//
//  ViewController.swift
//  HAnimation1
//
//  Created by JuanFelix on 2016/10/28.
//  Copyright © 2016年 JuanFelix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var image1:UIImageView!
    var image2:UIImageView!
    
    var topLayer:CAShapeLayer!
    var bottomLayer:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        image1.center = self.view.center
        image1.image = UIImage(named: "Eiffel1.png")
        image2 = UIImageView(frame: image1.bounds)
        image2.image = UIImage(named: "Eiffel2.png")
        image1.addSubview(image2)
        self.view.addSubview(image1)
        
        //
        image2.layer.mask = maskLayer()
        //
        loadAimation()
    }

    func maskLayer() -> CALayer! {
        let maskLayer = CALayer()
        maskLayer.frame = self.image2.bounds
        
        topLayer = CAShapeLayer()
        topLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topLayer.fillColor = UIColor.lightGray.cgColor
        topLayer.path = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 50, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).cgPath
        topLayer.position = CGPoint(x: 50, y: -50);
        maskLayer.addSublayer(topLayer)
        
        
        bottomLayer = CAShapeLayer()
        bottomLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        bottomLayer.fillColor = UIColor.lightGray.cgColor
        bottomLayer.path = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 50, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).cgPath
        bottomLayer.position = CGPoint(x: 50, y: 150);
        maskLayer.addSublayer(bottomLayer)
        
        return maskLayer
    }
    
    func loadAimation() {
        let topAnimation = CABasicAnimation(keyPath: "position")
        topAnimation.fromValue = NSValue(cgPoint: CGPoint(x: 50, y: -50))
        topAnimation.toValue = NSValue(cgPoint: CGPoint(x: 50,y: 1))
        topAnimation.duration = 5.0
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.isRemovedOnCompletion = false
        
        topLayer.add(topAnimation, forKey: "TOP")
        
        let bottomAnimation = CABasicAnimation(keyPath: "position")
        bottomAnimation.fromValue = NSValue(cgPoint: CGPoint(x: 50,y: 150))
        bottomAnimation.toValue = NSValue(cgPoint: CGPoint(x: 50,y: 99))
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomAnimation.duration = 5.0
        
        bottomLayer.add(bottomAnimation, forKey: "BOTTOM")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

