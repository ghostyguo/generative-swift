//
//  HelloFormViewController3.swift
//  GenerativeSwift
//
//  Created by Tatsuya Tobioka on 4/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import C4

class HelloFormViewController3: HelloFormViewController2 {

    // FIXME
    override var strokeColor: Color {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return super.strokeColor.colorWithAlpha(0.1)
        case 1:
            return C4Blue.colorWithAlpha(0.1)
        case 2:
            return C4Pink.colorWithAlpha(0.1)
        case 3:
            return C4Purple.colorWithAlpha(0.1)
        default:
            fatalError()
        }
    }
    
    let segmentedControl = UISegmentedControl(items: ["Gray", "Blue", "Pink", "Purple"]) // FIXME
 
    override init() {
        super.init()
        title = "Hello Form 3"
        trash = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.sizeToFit()
        segmentedControl.selectedSegmentIndex = 0
        let item = UIBarButtonItem(customView: segmentedControl)
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems = [flexible, autoItem, flexible, circleItem, flexible, item, flexible]
    }
    
    override func nextX(_ x: Double) -> Double {
        segmentedControl.selectedSegmentIndex = random(min: 0, max: segmentedControl.numberOfSegments)
        
        return super.nextX(x)
    }
}
