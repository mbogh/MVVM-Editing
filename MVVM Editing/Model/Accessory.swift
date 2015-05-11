//
//  Accessory.swift
//  MVVM Editing
//
//  Created by Morten Bøgh on 11/05/15.
//  Copyright (c) 2015 Just A Beech. All rights reserved.
//

import Foundation

class Accessory {
    var name: String
    var address: Int

    init(address: Int) {
        self.name = "Accessory #\(address)"
        self.address = address
    }

    func updateName(name: String!, completionHandler completion: ((NSError!) -> Void)!) {
        self.name = name
        if let completion = completion {
            completion(nil)
        }
    }
}