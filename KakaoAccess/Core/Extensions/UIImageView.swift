//
//  UIImageView.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

extension UIImageView {
	func loadImage(from string: String) {
		guard let url = URL(string: string) else { return }
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				print("Error loading image: \(error)")
			} else {
				if let data = data {
					DispatchQueue.main.async {
						self.image = UIImage(data: data)
					}
				}
			}
		}.resume()
	}
}
