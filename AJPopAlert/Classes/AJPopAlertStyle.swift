//
//
//  Pods
//
//  Created by Ajiejoy on 10/09/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.
 

import UIKit

open class AJPopAlertStyle {
    public static let shared =  AJPopAlertStyle()
    
    open var backgroundContent = UIColor(red: 245.0/255.0, green: 246.0/255.0, blue: 250.0/255.0, alpha: 1)
    open var backgroundAction = UIColor(red: 245.0/255.0, green: 246.0/255.0, blue: 250.0/255.0, alpha: 1)
    open var dimBackground = UIColor.black.withAlphaComponent(0.2)
    open var cornerRadius : CGFloat = 10.0
    open var heightAction : CGFloat = 40.0
    open var fontTitle = UIFont.boldSystemFont(ofSize: 16)
    open var fontMessage = UIFont.systemFont(ofSize: 14)
    open var titleColor = UIColor.darkGray
    open var messageColor = UIColor.darkGray
    open var padding : UIEdgeInsets = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    
}
