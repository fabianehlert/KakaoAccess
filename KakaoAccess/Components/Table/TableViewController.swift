//
//  TableViewController.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	
	var aircraft: [Aircraft]?
	
	// MARK: - ViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
		
		self.aircraft = Parser.parseAircraft(file: "Aircraft.json")
		self.tableView.reloadData()
	}
	
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TableViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return aircraft?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell {
			cell.viewModel = AircraftViewModel(aircraft: self.aircraft?[indexPath.row])
			cell.selectionStyle = .none
			return cell
		}
		return UITableViewCell()
	}
	
}
