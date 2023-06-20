//
//  ViewController.swift
//  Project5-TableWithDynamicCell
//
//  Created by 최우태 on 2023/06/08.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    var model: Model!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        loadArtistData()
    }
    
    func setUI() {
        self.title = "Artistry"
    }
    
    func loadArtistData() {
        // artists.json 파일 경로
        guard let path = Bundle.main.path(forResource: "artists", ofType: "json") else {
            return
        }
        
        // 경로에 있는 파일을 String으로 가져오기
        guard let jsonString = try? String(contentsOfFile: path) else {
            return
        }
        
        // String -> Model 객체
        let data = jsonString.data(using: .utf8)!
        guard let parsedData = try? JSONDecoder().decode(Model.self, from: data) else {
            return
        }
        
        model = parsedData
    }

}

