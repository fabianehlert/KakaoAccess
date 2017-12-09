//
//  CollectionViewController.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	
	var aircraft: [Aircraft]?
	
	// MARK: - ViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
		
		self.aircraft = Parser.parseAircraft(file: "Aircraft.json")
		self.collectionView?.reloadData()
	}
	
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CollectionViewController {
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.aircraft?.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell {
			cell.viewModel = AircraftViewModel(aircraft: self.aircraft?[indexPath.item])
			return cell
		}
		return UICollectionViewCell()
	}
	
}
