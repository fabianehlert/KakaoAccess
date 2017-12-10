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
	@IBOutlet private weak var settingSwitch: UISwitch?
	
}
