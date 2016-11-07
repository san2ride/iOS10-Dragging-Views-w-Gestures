//
//  MyView.swift
//  Gestures
//
//  Created by don't touch me on 11/7/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    // This variable will keep track of the last positionof a user's touch
    var lastLocation = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Initialization code
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MyView.detectPan(_:)))
        
        self.gestureRecognizers = [panRecognizer]
        
        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(_ recognizer:UIPanGestureRecognizer) {
        //translation var detects the new coordinates of the view when panning
        let translation = recognizer.translation(in: self.superview)
        
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //promote the touched view
        self.superview?.bringSubview(toFront: self)
        // remember original location
        lastLocation = self.center
    }
    
    
    

}
