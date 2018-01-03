//
//  SettingsCell.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 10.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
	
	var title: String? {
		didSet {
			if let title = self.title {
				self.nameLabel?.text = title
			}
		}
	}
	
	@IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var settingSwitch: UISwitch? {
        didSet {
            self.settingSwitch?.isAccessibilityElement = false
        }
    }
    
    override var accessibilityHint: String? {
        get {
            return "Double click to toggle"
        }
        set { }
    }
    
    override var isAccessibilityElement: Bool {
        get {
            return true
        }
        set { }
    }
    
    override var accessibilityValue: String? {
        get {
            guard let s = self.settingSwitch else { return nil }
            return s.isOn ? "On" : "Off"
        }
        set { }
    }
    
    override func accessibilityActivate() -> Bool {
        guard let s = self.settingSwitch else { return false }
        s.setOn(!s.isOn, animated: true)
        return true
    }
	
}
