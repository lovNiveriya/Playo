//
//  ViewController.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit
import MLTontiatorView

class ViewController: UIViewController {
    var MasterData:DataMaster?
    let viewActivitySmall = MLTontiatorView()
    @IBOutlet weak var TabelViewC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TabelViewC.delegate = self
        TabelViewC.dataSource = self
        self.TabelViewC.estimatedRowHeight = UITableView.automaticDimension
        viewActivitySmall.spinnerSize = .MLSpinnerSizeMedium
        viewActivitySmall.spinnerColor = UIColor.white
        addActivityIndicatorToView(activityIndicator: viewActivitySmall, view: self.view)
        self.view.isUserInteractionEnabled = false
        APICaller.shared.GetMasterData { data in
            self.MasterData = data
            self.TabelViewC.reloadData()
            self.view.isUserInteractionEnabled = true
            self.viewActivitySmall.stopAnimating()
            
        } failure: { _ in
            self.view.isUserInteractionEnabled = true
            self.viewActivitySmall.stopAnimating()
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .black
    }
    
    func addActivityIndicatorToView(activityIndicator: MLTontiatorView, view: UIView){

        self.view.addSubview(activityIndicator)

        viewActivitySmall.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))

        activityIndicator.startAnimating()

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
        cell.NewsImage.clipsToBounds = true
        
        return cell
    }
    
}


//MARK: TabelView Delegate
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "webView") as! WebViewController
        nextViewController.webViewURL = MasterData?.articles?[indexPath.row].url ?? ""
        nextViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}
