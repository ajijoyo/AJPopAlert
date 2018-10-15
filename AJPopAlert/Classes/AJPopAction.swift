//
//
//  Pods
//
//  Created by Ajiejoy on 15/10/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.
 

public enum AJPopActionType {
    case destructive
    case normal
}

protocol AJPopActionProtocol  {
    
    var type : AJPopActionType! {get set}
    var action : AJPopActionHandler? {get set}
}

open class AJPopAction : UIControl, AJPopActionProtocol {
    
    open var type: AJPopActionType! = .normal
    open var action: AJPopActionHandler?
    
}
