//
//  WorkListViewController.swift
//  Project5-TableWithDynamicCell
//
//  Created by 편성경 on 2023/06/21.
//

import UIKit

class WorkListViewController: UIViewController {
    
    @IBOutlet weak var workListTableView: UITableView!
    
    var works: [Work]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
    }
    
    func setConfig() {
        workListTableView.delegate = self
        workListTableView.dataSource = self
    }
}

extension WorkListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let work = works[indexPath.row]
        let cell = workListTableView.dequeueReusableCell(withIdentifier: "WorkListTableViewCell", for: indexPath) as! WorkListTableViewCell
        cell.workImageView.image = UIImage(named: work.image)
        cell.workNameLabel.text = work.title
        cell.workInfoTextView.text = work.info
        print(work.info)
        
        return cell
    }
    
    
}
