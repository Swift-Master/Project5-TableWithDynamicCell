//
//  ViewController.swift
//  Project5-TableWithDynamicCell
//
//  Created by 최우태 on 2023/06/08.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    @IBOutlet weak var artistListTableView: UITableView!
    
    var artists: [Artist]!
    var works: [Work]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConfig()
        
        loadArtistData()
    }
    
    // MARK: - 초기화
    func setUI() {
        self.title = "Artistry"
    }
    
    func setConfig() {
        artistListTableView.dataSource = self
        artistListTableView.delegate = self
    }
    
    // MARK: - artists.json 데이터 불러오기
    func loadArtistData() {
        // artists.json 파일 경로
        guard let path = Bundle.main.path(forResource: "artists", ofType: "json") else {
            return
        }
        
        // 경로에 있는 파일을 String으로 가져오기
        guard let jsonString = try? String(contentsOfFile: path) else {
            return
        }
        
        // String -> Data -> Model 객체
        let data = jsonString.data(using: .utf8)!
        guard let parsedData = try? JSONDecoder().decode(Model.self, from: data) else {
            return
        }
        
        artists = parsedData.artists
    }

}

// MARK: - EXTENSION TableView
extension ArtistListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artistListTableView.dequeueReusableCell(withIdentifier: "ArtistListTableViewCell", for: indexPath) as! ArtistListTableViewCell
        cell.artistImageView.image = UIImage(named: artists[indexPath.row].image)
        cell.artistNameLabel.text = artists[indexPath.row].name
        cell.artistBioTextView.text = artists[indexPath.row].bio
        cell.artistBioTextView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    // WorkListView 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workVC = storyboard?.instantiateViewController(withIdentifier: "WorkListViewController") as! WorkListViewController
        workVC.works = artists[indexPath.row].works
        navigationController?.pushViewController(workVC, animated: true)
    }
    
}

