//
//  ViewController.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	private var pageControl: KakaoPageControl = {
		let control = KakaoPageControl(frame: .zero, numberOfPages: 4)
		control.translatesAutoresizingMaskIntoConstraints = false
		return control
	}()
	
    @IBOutlet private weak var settingsButton: UIBarButtonItem? {
        didSet {
            self.settingsButton?.accessibilityLabel = "Settings"
        }
    }
    
	// MARK: - ViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(self.pageControl)
		NSLayoutConstraint.activate([
			self.pageControl.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
													  constant: 20),
			self.pageControl.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
													   constant: -20),
			self.pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
													 constant: -20),
			self.pageControl.heightAnchor.constraint(equalToConstant: 15)
		])
	}
	
	// MARK: - Actions
	
	@IBAction private func stepperClicked(stepper: UIStepper) {
		self.pageControl.currentPage = Int(stepper.value)
	}
	
}
