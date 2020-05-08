//
//  NameTextFieldBulletinPageItem.swift
//  KAT
//
//  Created by Alex on 5/7/20.
//  Copyright © 2020 KAT. All rights reserved.
// Adapted from https://github.com/alexaubry/BulletinBoard/blob/bf67b0b909c05b85d7e483d5072e3cb3515ff421/Example/Swift/Bulletin/TextFieldBulletinPage.swift
//

import UIKit
import BLTNBoard

class NameTextFieldBulletinPageItem: BLTNPageItem {
    
    @objc public var textField: UITextField!
    @objc public var textInputHandler: ((BLTNActionItem, String?) -> Void)? = nil
    
    override func makeViewsUnderDescription(with interfaceBuilder: BLTNInterfaceBuilder) -> [UIView]? {
        textField = interfaceBuilder.makeTextField(placeholder: "First and Last Name", returnKey: .done, delegate: self)
        return [textField]
    }
    
    override func tearDown() {
        super.tearDown()
        textField?.delegate = nil
    }

    override func actionButtonTapped(sender: UIButton) {
        textField.resignFirstResponder()
        super.actionButtonTapped(sender: sender)
    }
}

extension NameTextFieldBulletinPageItem: UITextFieldDelegate {

    @objc open func isInputValid(text: String?) -> Bool {

        if text == nil || text!.isEmpty {
            return false
        }
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        if isInputValid(text: textField.text) {
            textInputHandler?(self, textField.text)
        } else {
            descriptionLabel!.textColor = .red
            descriptionLabel!.text = "You must enter some text to continue."
            textField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        }
    }
}
