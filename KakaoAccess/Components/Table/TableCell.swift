//
//  TableCell.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
	
	var viewModel: AircraftViewModel? {
		didSet {
			self.updateViewModel(self.viewModel)
		}
	}
	
	@IBOutlet private weak var titleLabel: UILabel?
	@IBOutlet private weak var rangeLabel: UILabel?
	@IBOutlet private weak var seatsLabel: UILabel?
	@IBOutlet private weak var mtowLabel: UILabel?
	
	// MARK: -
	
	override func prepareForReuse() {
		self.titleLabel?.text = nil
		self.rangeLabel?.text = nil
		self.seatsLabel?.text = nil
		self.mtowLabel?.text = nil
		super.prepareForReuse()
	}
	
	private func updateViewModel(_ model: AircraftViewModel?) {
		self.titleLabel?.text = model?.name
		self.rangeLabel?.text = model?.range
		self.seatsLabel?.text = model?.seats
		self.mtowLabel?.text = model?.mtow
	}
	
}

