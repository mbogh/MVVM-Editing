//
//  AccessoryCell.swift
//  MVVM Editing
//
//  Created by Morten Bøgh on 11/05/15.
//  Copyright (c) 2015 Just A Beech. All rights reserved.
//

import UIKit

class AccessoryCell: UICollectionViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!

    private var _editing: Bool = false

    var viewModel: AccessoryViewModel? {
        didSet {
            if let viewModel = self.viewModel {
                self.nameLabel.text = viewModel.name
                self.nameTextField.text = viewModel.name
            }
        }
    }

}

// MARK: - Editing
extension AccessoryCell {

    var editing: Bool {
        get { return self._editing }
        set { self.setEditing(newValue, animated: false) }
    }

    func setEditing(editing: Bool, animated: Bool) {
        if editing != _editing {
            _editing = editing
            let duration: NSTimeInterval = animated ? 0.35 : 0

            if editing {
                self.nameTextField.becomeFirstResponder()
            }
            else {
                self.nameTextField.resignFirstResponder()
            }

            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.nameLabel.alpha = editing ? 0 : 1

                self.nameTextField.alpha = editing ? 1 : 0
            })
        }
    }

}
