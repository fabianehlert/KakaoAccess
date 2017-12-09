//
//  KakaoPageControl.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class KakaoPageControl: UIView {
	
	private enum Const {
		static let innerMargin: CGFloat = 10
		
		static let inactiveColor = UIColor.lightGray.cgColor
		static let activeColor = UIColor.black.cgColor
	}
	
	var currentPage = 0 {
		willSet {
			assert(newValue <= self.numberOfPages-1)
		}
		didSet {
			for (i, indicator) in self.indicators.enumerated() {
				indicator.fillColor = (i == self.currentPage) ? Const.activeColor : Const.inactiveColor
			}
		}
	}
	private var numberOfPages: Int
	
	private var indicators = [CAShapeLayer]()
	
	// MARK: - Init
	
	init(frame: CGRect, numberOfPages: Int) {
		self.numberOfPages = numberOfPages
		
		super.init(frame: frame)
		
		for _ in 0..<numberOfPages {
			let indicator = CAShapeLayer()
			self.layer.addSublayer(indicator)
			self.indicators.append(indicator)
		}
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(decrement))
		swipeLeft.direction = .left
		self.addGestureRecognizer(swipeLeft)
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(increment))
		swipeRight.direction = .right
		self.addGestureRecognizer(swipeRight)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: -
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		for (i, indicator) in self.indicators.enumerated() {
			let w = ((self.frame.width / CGFloat(self.numberOfPages)) - Const.innerMargin) + (Const.innerMargin/CGFloat(self.numberOfPages))
			indicator.path = UIBezierPath(roundedRect: CGRect(x: (CGFloat(i) * (w + Const.innerMargin)),
															  y: 0,
															  width: w,
															  height: self.frame.height),
										  cornerRadius: self.frame.height / 2).cgPath
			indicator.fillColor = i == self.currentPage ? Const.activeColor : Const.inactiveColor
		}
	}
	
	@objc
	private func increment() {
		let new = self.currentPage + 1
		self.currentPage = new >= (self.numberOfPages-1) ? (self.numberOfPages-1) : new
	}
	
	@objc
	private func decrement() {
		let new = self.currentPage - 1
		self.currentPage = new < 0 ? 0 : new
	}
	
}
