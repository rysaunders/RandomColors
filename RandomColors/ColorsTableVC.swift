//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by Ryan Saunders on 1/27/22.
//

import UIKit

class ColorsTableVC: UIViewController {
    // obvious, but an empty array of UIColor
    var colors: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    // Add 50 (in this case) random colors to the colors array
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    // This is triggered when I do the row select below
    // prepares for the segue by passing data over to the ColorsDetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
    
}

// Created an extension to clean up the code a bit
// This conforms to the UITableViewDelegate/DataSource and handles those
//  specific functions
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    // How many rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    // What to show in the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    // When you select a table row, what do?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailVC", sender: color)
    }
}
