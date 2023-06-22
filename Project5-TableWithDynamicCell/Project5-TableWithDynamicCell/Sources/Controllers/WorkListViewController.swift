//
//  WorkListViewController.swift
//  Project5-TableWithDynamicCell
//
//  Created by 편성경 on 2023/06/21.
//

import UIKit

class WorkListViewController: UIViewController {
    
    @IBOutlet weak var workListTableView: UITableView!
    
    var artistName: String!
    var works: [Work]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConfigTableView()
    }
    
    func setUI() {
        self.title = artistName
    }
    
    func setConfigTableView() {
        workListTableView.delegate = self
        workListTableView.dataSource = self
        
        workListTableView.rowHeight = UITableView.automaticDimension
        workListTableView.estimatedRowHeight = 100
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
        cell.workInfoLabel.text = work.info
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! WorkListTableViewCell
        if cell.workInfoLabel.isHidden {
            cell.workInfoLabel.isHidden = !cell.workInfoLabel.isHidden
            cell.selectInfoLabel.isHidden = !cell.selectInfoLabel.isHidden
        } else {
            cell.workInfoLabel.isHidden = !cell.workInfoLabel.isHidden
            cell.selectInfoLabel.isHidden = !cell.selectInfoLabel.isHidden
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}
