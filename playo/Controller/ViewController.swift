//
//  ViewController.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APICaller.shared.GetMasterData { _ in
        
        } failure: { _ in
            
        }

    }


}

