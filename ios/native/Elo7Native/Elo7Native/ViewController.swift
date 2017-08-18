//
//  ViewController.swift
//  Elo7Native
//
//  Created by Mauricio  Olimpio on 17/08/17.
//  Copyright © 2017 Mauricio  Olimpio. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var model:CarrearModel?
    
    @IBOutlet weak var headerLogo: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        Alamofire.request("http://www.mocky.io/v2/59964f7b110000180dcc4427").responseJSON { response in
            
            self.model = CarrearModel.populate(dictionary: response.value as! NSDictionary)
            
            self.buildView()

        }
    }
    
    func buildView() {
        
        if let model = model{
            //Header View Mounting
            let imageLogoURL = URL(string: model.header.logo)
            
            self.headerLogo.kf.setImage(with: imageLogoURL, options: [.transition(.fade(0.3))])
            
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch indexPath.section {
            
        case CarrearModel.KindOfContent.Header.rawValue : //header
            return 300
            
        case CarrearModel.KindOfContent.Culture.rawValue: //culture
            print("CULTURE")
            return 270
        case CarrearModel.KindOfContent.Social.rawValue: //Social
            print("SOCIAL")
            return 500
        default://Areas
            print("AREAS")
            return 50
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        switch indexPath.section {
            
        case CarrearModel.KindOfContent.Header.rawValue : //header
            
            print("HEADER")
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
            headerCell.setup(data: model!.header)
            cell = headerCell
            
        case CarrearModel.KindOfContent.Culture.rawValue: //culture
            
            print("CULTURE")
            let cultureCell = tableView.dequeueReusableCell(withIdentifier: "cultureCell") as! CultureTableViewCell
            cultureCell.setup(data: model!.culture.cultureItems[indexPath.row])
            cell = cultureCell
            
        case CarrearModel.KindOfContent.Social.rawValue: //Social
            
            print("SOCIAL")
            cell = tableView.dequeueReusableCell(withIdentifier: "socialCell")!
            
        default://Areas
            
            print("AREAS")
            cell = tableView.dequeueReusableCell(withIdentifier: "areasCell")!
            
        }
        
        return cell!
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let model = model{
            var numberOfRows = 0;
            
            switch section {
            case CarrearModel.KindOfContent.Header.rawValue : //header
                numberOfRows = 1
            case CarrearModel.KindOfContent.Culture.rawValue: //culture
                numberOfRows = model.culture.cultureItems.count
            case CarrearModel.KindOfContent.Social.rawValue: //areas
                numberOfRows = model.social.socialItems.count
            default:
                break
            }
            return numberOfRows

        }
        
        return 0
        
    }

}

