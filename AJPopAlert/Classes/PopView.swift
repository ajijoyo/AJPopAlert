//
//
//  Pods
//
//  Created by Ajiejoy on 10/09/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.
 

import UIKit

open class PopView: UIView {

    var _title : NSAttributedString?
    var _message : NSAttributedString?
    var style:AJPopAlertStyle!
    
    init(title:NSAttributedString?, message:NSAttributedString?,style:AJPopAlertStyle = AJPopAlertStyle.shared) {
        super.init(frame: .zero
        )
        self._title = title
        self._message = message
        self.style = style
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI(){
        if let title = self._title {
            let titleLabel = UILabel()
            titleLabel.numberOfLines = 0
            titleLabel.attributedText = title
            self.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.left.top.right.equalToSuperview().inset(16)
            }
        }
        
        if let message = self._message {
            let last = self.subviews.last
            
            let messageLabel = UILabel()
            messageLabel.numberOfLines = 0
            messageLabel.attributedText = message
            self.addSubview(messageLabel)
            messageLabel.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview().inset(16)
                if let last = last {
                    make.top.equalTo(last.snp.bottom).offset(4)
                }
                else{
                    make.top.equalToSuperview().inset(16)
                }
                make.bottom.equalToSuperview().inset(16)
            }
        }
        
        
        self.layer.cornerRadius = style.cornerRadius
        self.layer.backgroundColor = style.backgroundContent.cgColor
    }
}
