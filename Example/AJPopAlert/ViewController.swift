//
//  ViewController.swift
//  AJPopAlert
//
//  Created by ajijoyo on 09/09/2018.
//  Copyright (c) 2018 ajijoyo. All rights reserved.
//

import UIKit
import AJPopAlert

class ViewController: UIViewController {

    var mainTable : UITableView!
    
    var menus : [(name:String,tag:Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus.append((name: "PopUp Default", tag: 1))
        menus.append((name: "PopUp with duration 2 seconds", tag: 2))
        menus.append((name: "PopUp CancelAble", tag: 3))
        menus.append((name: "PopUpWithout action", tag: 4))
        
        mainTable = UITableView()
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.rowHeight = 44
        mainTable.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.view.addSubview(mainTable)
        mainTable.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func showPopUp(){
        let vc = AJPopAlert(title: "asda", message: "asdsadas\nasdsadas\nasdsadas\nasdsadas\nasdsadas\nasdsadas\nasdsadas",position:.bottom)
        vc.addAction(title: "asdad") { (action) in
            print("1")
        }

        vc.addAction(title: "asdddad") { (action) in
            print("2")
        }
        
        vc.addAction(title: "Destruct", type: .destructive) { (action) in
            action.dismiss(animated: true, completion: nil)
        }
        
        vc.show(duration: 2) {
            
        }
        

    }
    
    func showingDefaultPopUp(){
        let vc = AJPopAlert(title: "Lorem Ipsum", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",position:.bottom)
        vc.addAction(title: "Ok") { (action) in
            print("ok")
        }
        vc.addAction(title: "Later") { (action) in
            print("later")
        }
        
        vc.addAction(title: "Cancel", type: .destructive) { (action) in
            action.dismiss(animated: true, completion: nil)
        }
        
        vc.show()
    }
    
    func showingDefaultWithDurationPopUp(){
        let vc = AJPopAlert(title: "Lorem Ipsum", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",position:.bottom)
        vc.addAction(title: "Ok") { (action) in
            print("ok")
        }
        vc.addAction(title: "Later") { (action) in
            print("later")
        }
        
        vc.addAction(title: "Cancel", type: .destructive) { (action) in
            action.dismiss(animated: true, completion: nil)
        }
        
        vc.show(duration: 2)
    }
    
    func showingDefaultCancelAblePopUp(){
        let vc = AJPopAlert(title: "Lorem Ipsum", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",position:.bottom)
        vc.addAction(title: "Ok") { (action) in
            print("ok")
        }
        vc.addAction(title: "Later") { (action) in
            print("later")
        }
        
        vc.addAction(title: "Cancel", type: .destructive) { (action) in
            action.dismiss(animated: true, completion: nil)
        }
        
        vc.show(cancelAble: true)
    }
    
    func showingPopUpWithoutActions(){
        let vc = AJPopAlert(title: "Lorem Ipsum", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",position:.bottom)
        vc.show(cancelAble: true)
    }
}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = menus[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menus[indexPath.row].tag {
        case 1:
            showingDefaultPopUp()
        case 2:
            showingDefaultWithDurationPopUp()
        case 3:
            showingDefaultCancelAblePopUp()
        case 4:
            showingPopUpWithoutActions()
        default:
            break
        }
    }
}

