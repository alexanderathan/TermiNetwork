//
//	FoodCategory.swift
//
//	Create by Vasilis Panagiotopoulos on 15/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct FoodCategory : Codable {
	let idCategory: String
	let strCategory: String
	let strCategoryDescription: String
	let strCategoryThumb: String

	enum CodingKeys: CodingKey {
		case idCategory
		case strCategory
		case strCategoryDescription
		case strCategoryThumb
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idCategory = try values.decode(String.self, forKey: .idCategory)
		strCategory = try values.decode(String.self, forKey: .strCategory)
		strCategoryDescription = try values.decode(String.self, forKey: .strCategoryDescription)
		strCategoryThumb = try values.decode(String.self, forKey: .strCategoryThumb)
	}
}
