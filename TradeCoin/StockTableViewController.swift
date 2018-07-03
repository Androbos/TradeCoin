//
//  StockTableViewController.swift
//  TradeCoin
//
//  Created by otto on 6/25/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit
import Alamofire

// loading, coredata, Charts, dev,icon, loading screentouch auth, inet senitive, refacroring, search icon, person icon, 4 cells, main view, cell img, 5 icons, TCleanArchitectureRxSwift, MVVM, RX, CoreDat, UIKIT, Tests, Brian
// coredata after fetch
// mvvm+Brian, rx, coredata, alamofire
class StockTableViewController: UITableViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    var stockString = "https://api.iextrading.com/1.0/stock/market/list/mostactive"
    var cryptoString = "https://api.iextrading.com/1.0/stock/market/list/gainers"
    var companies = [Company]()
    var cryptos = [Company]()
    
    fileprivate func fetchJSON(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                   
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                        self.cryptos = try decoder.decode([Company].self, from: data)
                        
                    
                    
                   // self.tableView.reloadData()
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }
            }.resume()
    }
    
    fileprivate func fetchJSONStock(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    self.companies = try decoder.decode([Company].self, from: data)
                    
                    
                    
                    self.tableView.reloadData()
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }
            }.resume()
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        fetchJSONStock(stockString)
        fetchJSON(cryptoString)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
             return cryptos.count
        } else {
            return companies.count
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Crypto"
        } else {
            return "Stock"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! CompanyTableViewCell
       
        if indexPath.section == 1 {
            let company = companies[indexPath.row]
            cell.companyNameLabel.text = company.companyName
            cell.symbolLabel.text = company.symbol
            cell.latestPriceLabel.text = "\(company.latestPrice)"
            if (company.change < 0) {
                 cell.changeLabel.textColor = .red
                 cell.changePercentLabel.textColor = .red
            } else {
                cell.changeLabel.textColor = .green
                cell.changePercentLabel.textColor = .green
            }
            cell.changeLabel.text = "\(company.change)"
            cell.changePercentLabel.text = "(\(company.changePercent)%)"
            
            return cell
        } else {
            let crypto = cryptos[indexPath.row]
            cell.companyNameLabel.text = crypto.companyName
            cell.symbolLabel.text = crypto.symbol
            cell.latestPriceLabel.text = "\(crypto.latestPrice)"
            if (crypto.change < 0) {
                cell.changeLabel.textColor = .red
                cell.changePercentLabel.textColor = .red
            } else {
                cell.changeLabel.textColor = .green
                cell.changePercentLabel.textColor = .green
            }
            cell.changeLabel.text = "\(crypto.change)"
            cell.changePercentLabel.text = "(\(crypto.changePercent)%)"
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 126.0;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.font = UIFont(name: "Helvetica", size: 16)
        header?.textLabel?.textColor = .green
        header?.backgroundColor = .black
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCompany: Company
        selectedCompany = companies[indexPath.row]
        
        // Set up the detail view controller to show.
        //let detailsViewController = DetailsTableViewController.detailViewControllerForProduct(selectedCompany)
        
      //  navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
