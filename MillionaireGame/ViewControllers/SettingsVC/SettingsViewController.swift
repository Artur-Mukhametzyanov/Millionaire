//
//  SettingsViewController.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 13.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var selectedOrder: QuestionsOrder {
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            return .sequence
        default:
            return .random
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentChangeValue()
    }
}

extension SettingsViewController {
    
    func segmentChangeValue() {
        segmentControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    @objc func valueChanged() {
        Game.shared.questionOrder = selectedOrder
    }
}
