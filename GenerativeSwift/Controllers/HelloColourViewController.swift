//
//  HelloColourViewController.swift
//  GenerativeSwift
//
//  Created by Tatsuya Tobioka on 4/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import C4

class HelloColourViewController: BaseCanvasController {
    let rectangle = Rectangle(frame: Rect(0, 0, 0, 0))

    override init() {
        super.init()
        title = "Hello Colour"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        rectangle.strokeColor = nil
        canvas.add(rectangle)
        let _ = canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            self.updateRectangle(center)
        }
        let _ = canvas.addTapGestureRecognizer { locations, center, state in
            self.updateRectangle(center)
        }
        updateRectangle(canvas.center)
    }
    
    func updateRectangle(_ point: Point) {
        let width = point.x + 1
        rectangle.frame.width = width
        rectangle.frame.height = width * canvas.height / canvas.width
        rectangle.center = canvas.center
        
        let hue = point.y / canvas.height
        rectangle.fillColor = Color(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        canvas.backgroundColor = Color(hue: 1.0 - hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}
