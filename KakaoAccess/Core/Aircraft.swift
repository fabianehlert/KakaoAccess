//
//  Aircraft.swift
//  KakaoAccess
//
//  Created by Fabian Ehlert on 09.12.17.
//  Copyright © 2017 Fabian Ehlert. All rights reserved.
//

import Foundation

struct Aircraft: Codable {
	
	let name: String
	let range: Int
	let seats: Int
	let mtow: Double
	
}

struct Parser {
	
	static func parseAircraft(file: String) -> [Aircraft]? {
		guard let path = Bundle.main.url(forResource: file, withExtension: nil) else {
			print("No such file!")
			return nil
		}
		
		do {
			let data = try Data(contentsOf: path)
			
			let decoder = JSONDecoder()
			return try decoder.decode([Aircraft].self, from: data)
		} catch let error {
			print("Error parsing JSON: \(error)")
		}
		return nil
	}
	
}

struct AircraftViewModel {
	
	let name: String
	let range: String
	let seats: String
	let mtow: String
	
	init?(aircraft: Aircraft?) {
		guard let aircraft = aircraft else { return nil }
		self.name = aircraft.name
		self.range = "\(aircraft.range) km"
		self.seats = "\(aircraft.seats) seats"
		self.mtow = "\(aircraft.mtow) tons"
	}
	
}
