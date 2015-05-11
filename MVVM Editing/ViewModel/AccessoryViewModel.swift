//
//  AccessoryViewModel.swift
//  MVVM Editing
//
//  Created by Morten Bøgh on 11/05/15.
//  Copyright (c) 2015 Just A Beech. All rights reserved.
//

import Foundation

class AccessoryViewModel {
    var accessory: Accessory
    var name: String

    init(accessory: Accessory) {
        self.accessory = accessory
        self.name = accessory.name
    }
}