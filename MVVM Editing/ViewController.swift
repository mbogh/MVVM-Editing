//
//  ViewController.swift
//  MVVM Editing
//
//  Created by Morten Bøgh on 11/05/15.
//  Copyright (c) 2015 Just A Beech. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var viewModel = AccessoriesViewModel()
    var okButtonItem: UIBarButtonItem!
    var cancelButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.okButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onOkTouch:")
        self.cancelButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "onCancelTouch:")
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

        self.collectionView?.scrollEnabled = !editing

        if editing {
            self.navigationItem.setLeftBarButtonItem(self.okButtonItem, animated: animated)
            self.navigationItem.setRightBarButtonItem(self.cancelButtonItem, animated: animated)
        }
        else {
            self.navigationItem.setLeftBarButtonItem(nil, animated: animated)
            self.navigationItem.setRightBarButtonItem(self.editButtonItem(), animated: animated)
        }

        if let indexPath = self.currentIndexPath() {
            let cell: AccessoryCell = self.collectionView!.cellForItemAtIndexPath(indexPath) as! AccessoryCell
            cell.setEditing(editing, animated: animated)
        }
    }

    // MARK: - Actions

    func onOkTouch(sender: UIBarButtonItem) {
        self.setEditing(false, animated: true)
    }

    func onCancelTouch(sender: UIBarButtonItem) {
        self.setEditing(false, animated: true)
    }

    func currentIndexPath() -> NSIndexPath? {
        var contentOffset = self.collectionView!.contentOffset
        contentOffset.x += self.view.frame.width/2
        contentOffset.y = 0
        return self.collectionView!.indexPathForItemAtPoint(contentOffset)
    }
}

extension ViewController: UICollectionViewDataSource {

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.accessories.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AccessoryCell = collectionView.dequeueReusableCellWithReuseIdentifier("AccessoryCell", forIndexPath: indexPath) as! AccessoryCell
        let accessory = self.viewModel.accessories[indexPath.row]
        let viewModel = AccessoryViewModel(accessory: accessory)
        cell.viewModel = viewModel

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - self.collectionView!.contentInset.top)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeZero
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSizeZero
    }
}

