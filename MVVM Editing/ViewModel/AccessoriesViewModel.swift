//
//  AccessoriesViewModel.swift
//  MVVM Editing
//
//  Created by Morten Bøgh on 11/05/15.
//  Copyright (c) 2015 Just A Beech. All rights reserved.
//

import Foundation

class AccessoriesViewModel {
    var accessories: [Accessory]

    init() {
        var accessories = [Accessory]()
        for(var i = 0; i < 10; i++) {
            let accessory = Accessory(address: i)
            accessories.append(accessory)
        }
        self.accessories = accessories
    }
}