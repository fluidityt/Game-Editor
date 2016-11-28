//
//  ItemView.swift
//  Game Editor
//
//  Created by Dude Guy on 11/21/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

// TODO: Header

class ItemView: UITableViewController {

/* Fields: */ var
              // Can I use a dictionary for this?
              // Can use udef.load for this? Followed by = Equipable(loadFrom: )?
							items				= ["Sword", "Shield"],
							insertTop		= false,
							testCounter = 0,
							testName		= "Item "


/* MARK: Funcs: */

	func grabCell(indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
	}

	// To the bottom:
	@IBAction func addItem(_ sender: Any) {
		testCounter += 1
		let newItem = testName + "\(testCounter)"
		items.append(newItem)

		let newPath = IndexPath(row: (items.count - 1), section: 0)
		tableView.insertRows(at: [newPath], with: .automatic)
	}


/* MARK: - Overrides: */

	override func viewDidLoad() {
		super.viewDidLoad();
	}

	/// didSelectRow()
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print( items[indexPath.row] )
	}

	/// makeRows()
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
		-> Int {
			return items.count;
	}

	/// grabCellAtRow()
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
		-> UITableViewCell {

			let cell = grabCell(indexPath: indexPath)
			cell.textLabel?.text = items[indexPath.row]

			return cell
	}

} // EoC
