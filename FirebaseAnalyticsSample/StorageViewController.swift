//
//  StorageViewController.swift
//  FirebaseAnalyticsSample
//
//  Created by 新見晃平 on 2016/10/04.
//  Copyright © 2016年 kohei. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class StorageViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    private let storage = FIRStorage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storageRef = storage.reference(forURL: "gs://fir-handson-ce2a8.appspot.com")
        //画像読み込み
        let ieRef = storageRef.child("images/windows.png")
        ieRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let ieImage: UIImage! = UIImage(data: data!)
                self.iconImageView.image = ieImage
            }
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadButton(_ sender: UIButton) {
        //アップロード
        let storageRef = storage.reference(forURL: "gs://fir-handson-ce2a8.appspot.com")

        if let data = UIImagePNGRepresentation(UIImage(named: "windows")!) {
            let riversRef = storageRef.child("images/windows.png")
            riversRef.put(data, metadata: nil, completion: { metaData, error in
                print(metaData)
                print(error)
            })
        }
    }
    
}

