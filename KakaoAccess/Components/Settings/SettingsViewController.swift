//
//  SettingsViewController.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 10.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
	
	let settings = ["Banana 🍌", "Strawberry 🍓", "Apple 🍏", "Lemon 🍋"]
	
	// MARK: - ViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
}

extension SettingsViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.settings.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Fruits"
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell {
			cell.title = self.settings[indexPath.row]
			cell.selectionStyle = .none
			return cell
		}
		return UITableViewCell()
	}
	
}
