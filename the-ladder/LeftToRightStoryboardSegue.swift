//
//  LeftToRightStoryboardSegue.swift
//  ladder
//
//  Created by Emily Chen on 3/28/17.
//  Copyright © 2017 Emily Chen. All rights reserved.
//

import UIKit

class RightToLeftStoryboardSegue: UIStoryboardSegue {
    override func perform()
    {
        let firstVC = self.source.view as UIView!
        let secondVC = self.destination.view as UIView!
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        
        secondVC!.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVC!, aboveSubview: firstVC!)
        
        // Animate the transition.
        UIView.animate(withDuration: 0.3, animations: { () -> Void in // set animation duration
            
            firstVC!.frame = firstVC!.frame.offsetBy(dx: -screenWidth, dy: 0.0) // old screen stay
            
            secondVC!.frame = secondVC!.frame.offsetBy(dx: -screenWidth, dy: 0.0) // new screen strave from left to right
            
        }) { (Finished) -> Void in
            self.source.present(self.destination as UIViewController,
                                                            animated: false,
                                                            completion: nil)
        }
    }
}
