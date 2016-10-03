//
//  ViewController.swift
//  FirebaseAnalyticsSample
//
//  Created by 新見晃平 on 2016/09/29.
//  Copyright © 2016年 kohei. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    
    let rootRef = FIRDatabase.database().reference()
    let storage = FIRStorage.storage()

    override func viewDidLoad() {
        super.viewDidLoad()

//        読み込み
//        rootRef.observe(.value, with: { snapshot in
//            print("\(snapshot.key) -> \(snapshot.value)")
//        })
//        書き込み
//        rootRef.child("food").setValue("りんごさま")
//
//        
               
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        FIRAnalytics.logEvent(withName: "tapButton", parameters: nil)
    }

}

