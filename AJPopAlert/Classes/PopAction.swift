//
//
//  Pods
//
//  Created by Ajiejoy on 09/09/18 with love and sweet
//  Contact me on self.ajiejoy@gmail.com
//  Copyright © 2017 Ajiejoy. All rights reserved.
 

import UIKit

class PopAction: AJPopAction {

    var _title : NSAttributedString!
    var style : AJPopAlertStyle!
    
    init(title:NSAttributedString, type:AJPopActionType , style:AJPopAlertStyle = AJPopAlertStyle.shared) {
        super.init(frame: .zero)
        self.type = type
        _title = title
        self.style = style
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.isUserInteractionEnabled = true
        
        let title = UILabel()
        title.attributedText = _title
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(style.heightAction)
        }
        
        if type == .destructive {
            self.layer.cornerRadius = style.cornerRadius
        }
        
        self.layer.backgroundColor = style.backgroundAction.cgColor
    }
}
