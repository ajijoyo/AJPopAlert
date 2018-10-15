//
//
//  Pods
//
//  Created by Ajiejoy on 09/09/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.
 

import UIKit
import SnapKit

open class PopViewController: UIViewController {
    
    open var customView : UIView!
    
    let containerView = UIView()
    let containerActions = UIView()
    var actionTag = 0
    var actions = [AJPopInputHandler]()
    var subViewActions = [AJPopAction]()
    
    var _title : NSAttributedString?
    var _message : NSAttributedString?
    var position : AJPopAlert.AJPopPosition = .bottom
    
    var isCancelAble = false
    var duration : CGFloat? = nil
    
    var style:AJPopAlertStyle!
    
    var complete : (() -> Void)?
    
    init(customView : UIView ,position: AJPopAlert.AJPopPosition = .bottom , style:AJPopAlertStyle = AJPopAlertStyle.shared) {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        self.customView = customView
        self.position = position
        self.style = style
        setupCustomView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func commitView(){
        containerView.layoutIfNeeded()
        
        let normalActions = subViewActions.filter({ $0.type == .normal })
        let desctructiveActions = subViewActions.filter({ $0.type == .destructive })
        let isNoDestructiveActions = desctructiveActions.count == 0
        
        customView.snp.remakeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
        
        containerActions.snp.remakeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(customView.snp.bottom).offset(8)
            if subViewActions.count == 0 || isNoDestructiveActions {
                make.bottom.equalToSuperview()
            }
        }
        
        // generate Normal Actions
        for view in normalActions {
            let last = containerActions.subviews.last
            containerActions.addSubview(view)
            view.snp.remakeConstraints{ (make) in
                make.left.right.equalToSuperview()
                if let last = last {
                    make.top.equalTo(last.snp.bottom).offset(0.5)
                }
                else{
                    make.top.equalToSuperview()
                }
                
                if normalActions.last! == view {
                    make.bottom.equalToSuperview()
                }
            }
        }
        
        for view in desctructiveActions {
            guard let last = containerView.subviews.last else { break }
            containerView.addSubview(view)
            view.snp.remakeConstraints{ (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(last.snp.bottom).offset(16)
                if desctructiveActions.last! == view {
                    make.bottom.equalToSuperview()
                }
            }
        }
        
        if let duration = duration {
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(duration)) { [weak self] in
                self?.hide()
            }
        }
    }
    
    func addAction(sender: AJPopAction){
        if let action =  sender.action {
            sender.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
            sender.tag = actionTag
            actions.append(action)
            actionTag += 1
        }
        subViewActions.append(sender)
    }

    func setupCustomView(){
        self.view.endEditing(true)
        
        self.view.backgroundColor = style.dimBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissDidTap))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        subViewActions.removeAll()
        
        let voidtap = UITapGestureRecognizer(target: nil, action: nil)
        voidtap.cancelsTouchesInView = false
        containerView.addGestureRecognizer(voidtap)
        containerView.addSubview(customView)
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOpacity = 0.2
        customView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(containerView)
        
        containerActions.clipsToBounds = true
        containerActions.layer.backgroundColor = style.dimBackground.cgColor
        containerActions.layer.cornerRadius = style.cornerRadius
        containerView.addSubview(containerActions)
        
        containerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(style.padding)
            switch (position) {
            case .bottom :
                if #available(iOS 11.0, *) {
                    make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(style.padding)
                } else {
                    make.bottom.equalToSuperview().inset(style.padding)
                }
                
                break
            case .top :
                if #available(iOS 11.0, *) {
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(style.padding)
                } else {
                    make.top.equalToSuperview().inset(style.padding)
                }
                break
            case .center :
                make.center.equalToSuperview()
                break
            }
        }
        
        
    }
    
    func hide(){
        complete?()
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Listener
    
    @objc func dismissDidTap(){
        if isCancelAble {
            hide()
        }
    }
    
    @objc func didTap(sender:PopAction){
        actions[sender.tag](self)
    }
    
    
}
