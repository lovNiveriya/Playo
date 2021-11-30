//
//  ViewController.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit

class ViewController: UIViewController {
    var MasterData:DataMaster?
    @IBOutlet weak var TabelViewC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TabelViewC.delegate = self
        TabelViewC.dataSource = self
        self.TabelViewC.estimatedRowHeight = UITableView.automaticDimension
        APICaller.shared.GetMasterData { data in
            self.MasterData = data
            self.TabelViewC.reloadData()
            
        } failure: { _ in
            
        }

    }

}

//MARK: TabelView DataSource
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.MasterData?.totalResults ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nCell", for: indexPath) as! newsCell
        
        cell.titleLabel.text = MasterData?.articles?[indexPath.row].title
        cell.DescriptionLabel.text =  MasterData?.articles?[indexPath.row].description
        cell.NewsImage.downloaded(from: MasterData?.articles?[indexPath.row].urlToImage ?? "")
        cell.NewsImage.layer.borderWidth = 1.0
        cell.NewsImage.layer.masksToBounds = false
        cell.NewsImage.layer.borderColor = UIColor.white.cgColor
        //cell.NewsImage.layer.cornerRadius =  cell.NewsImage.frame.size.width - 50
        cell.NewsImage.clipsToBounds = true
        
        return cell
    }
    
}


//MARK: TabelView Delegate
extension ViewController:UITableViewDelegate{

}
