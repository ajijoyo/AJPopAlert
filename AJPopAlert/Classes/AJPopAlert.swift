//
//
//  Pods
//
//  Created by Ajiejoy on 09/09/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.



import UIKit


public typealias AJPopActionHandler = (UIViewController) -> Void
public typealias AJPopInputHandler = (UIViewController) -> Void

public class AJPopAlert {
    
    
    public enum AJPopPosition {
        case top
        case bottom
        case center
    }
    
    open var viewController : PopViewController!
    
    public convenience init(title:String?, message:String, position : AJPopPosition = .bottom ,style:AJPopAlertStyle = AJPopAlertStyle.shared) {
        var attributeTitle : NSAttributedString?
        if let title = title {
            attributeTitle = NSAttributedString(string: title, attributes: [.font:style.fontTitle,.foregroundColor:style.titleColor])
        }
        
        let attributeMessage = NSAttributedString(string: message, attributes: [.font:style.fontMessage,.foregroundColor:style.messageColor])
        
        let customView = PopView(title: attributeTitle, message: attributeMessage)
        self.init(customView: customView, position: position)
    }
    
    public convenience init(title:NSAttributedString?, message:NSAttributedString, position : AJPopPosition = .bottom ,style:AJPopAlertStyle = AJPopAlertStyle.shared) {
       
        let customView = PopView(title: title, message: message)
        self.init(customView: customView, position: position)
    }
    
    public init(customView:UIView, position : AJPopPosition = .bottom,style:AJPopAlertStyle = AJPopAlertStyle.shared) {
        viewController = PopViewController(customView: customView,position:position,style:style)
        
    }
    
    @discardableResult public func addAction(title:String,type:AJPopActionType = .normal ,action:AJPopActionHandler?) -> AJPopAlert {
        
        let attributTitle = NSAttributedString(string: title, attributes: [.font:UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.darkText])
        
        let popAction = PopAction(title: attributTitle, type: type)
        popAction.action = action
        viewController.addAction(sender: popAction)
        return self
    }
    
    @discardableResult public func addAction(title:NSAttributedString, type:AJPopActionType = .normal ,action:AJPopActionHandler?) -> AJPopAlert {
        let popAction = PopAction(title: title, type: type)
        popAction.action = action
        viewController.addAction(sender: popAction)
        return self
    }
    
    @discardableResult public func addAction(popAction:AJPopAction) -> AJPopAlert {
        viewController.addAction(sender: popAction)
        return self
    }
    
    /**
     complete: triggered when view did hide
     */
    public func show(cancelAble : Bool = false , duration: CGFloat? = nil,complete:(() -> Void)? = nil){
        if let top = UIApplication.topViewController() {
            viewController.isCancelAble = cancelAble
            viewController.duration = duration
            viewController.complete = complete
            viewController.commitView()
            top.present(viewController, animated: true, completion: nil)
        }
    }
    
    public func hide(){
        viewController.hide()
    }
}


extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
