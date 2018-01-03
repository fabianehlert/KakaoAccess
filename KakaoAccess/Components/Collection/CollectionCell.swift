//
//  CollectionCell.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
	
	var viewModel: AircraftViewModel? {
		didSet {
			self.updateViewModel(self.viewModel)
		}
	}
	
    @IBOutlet private weak var thumbnaiImageView: UIImageView? {
        didSet {
            self.thumbnaiImageView?.accessibilityIgnoresInvertColors = true
        }
    }
    @IBOutlet private weak var titleLabel: UILabel? {
        didSet {
            self.titleLabel?.isAccessibilityElement = false
        }
    }
    @IBOutlet private weak var rangeLabel: UILabel? {
        didSet {
            self.rangeLabel?.isAccessibilityElement = false
        }
    }
    @IBOutlet private weak var seatsLabel: UILabel? {
        didSet {
            self.seatsLabel?.isAccessibilityElement = false
        }
    }
    @IBOutlet private weak var mtowLabel: UILabel? {
        didSet {
            self.mtowLabel?.isAccessibilityElement = false
        }
    }
	
    override var isAccessibilityElement: Bool {
        get {
            return true
        }
        set { }
    }
    
    override var accessibilityLabel: String? {
        get {
            guard let vm = viewModel else { return nil }
            return vm.name + ", " + vm.range + ", " + vm.seats + ", " + vm.mtow
        }
        set { }
    }
    
	// MARK: -
	
	override func prepareForReuse() {
		self.thumbnaiImageView?.image = nil
		self.titleLabel?.text = nil
		self.rangeLabel?.text = nil
		self.seatsLabel?.text = nil
		self.mtowLabel?.text = nil
		super.prepareForReuse()
	}
	
	private func updateViewModel(_ model: AircraftViewModel?) {
		if let url = model?.imageURL {
			self.thumbnaiImageView?.loadImage(from: url)
		}
		self.titleLabel?.text = model?.name
		self.rangeLabel?.text = model?.range
		self.seatsLabel?.text = model?.seats
		self.mtowLabel?.text = model?.mtow
	}

}
