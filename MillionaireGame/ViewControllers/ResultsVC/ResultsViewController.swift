//
//  ResultsViewController.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 12.04.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.recordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultCell else {return UITableViewCell()}
        let record = Game.shared.recordsArray[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.scoreCount.text = "\(record.answeredQuestionCount ?? 0)"
        cell.date.text = dateFormatter.string(from: record.date!)
        return cell
    }
}
