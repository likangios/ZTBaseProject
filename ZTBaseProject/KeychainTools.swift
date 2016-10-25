//
//  test.swift
//  ZTBaseProject
//
//  Created by FengLing on 16/10/25.
//  Copyright © 2016年 lk. All rights reserved.
//

import UIKit
import KeychainAccess

class KeychainTools: NSObject {
    
   internal override init() {
    
        super.init()
    }
    func testMehtod(name:String,pwd:String) {
        let keychain = Keychain(service: "com.luck", accessGroup: "1")
        keychain[name] = pwd
    }
    
}
