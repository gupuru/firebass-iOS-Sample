//
//  RealTimeDatabaseViewController.swift
//  FirebaseAnalyticsSample
//
//  Created by 新見晃平 on 2016/10/04.
//  Copyright © 2016年 kohei. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RealTimeDatabaseViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    private let rootRef = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //読み込み
        rootRef.observe(.value, with: { snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
            if let snapshotValue = snapshot.value as? [String:Any] {
                if let text = snapshotValue["food"] as? String {
                    self.textLabel.text = text
                }
                
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func writeButton(_ sender: UIButton) {
        //書き込み
        rootRef.child("food").setValue("りんごさま")
    }
    
}

