//
//  ColorsDetailsVC.swift
//  RandomColors
//
//  Created by Ryan Saunders on 1/27/22.
//

import UIKit

class ColorsDetailsVC: UIViewController {

    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue

    }

}
