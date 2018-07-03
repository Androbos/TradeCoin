//
//  DetailsTableViewController.swift
//  TradeCoin
//
//  Created by otto on 7/1/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit
import Charts

class DetailsTableViewController: UITableViewController {
    
    var lineChartEntry = [ChartDataEntry]()
    var numbers: [Double] = [1.0, 3.5, 5.6]
    
    @IBOutlet weak var chartView: LineChartView!
    
    class func detailViewControllerForProduct(_ company: Company) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChart()
    }
    
    fileprivate func setupChart() {
        navigationItem.title = "SNAP"
        let values1 = [ChartDataEntry(x: 2.5, y: 1.0), ChartDataEntry(x: 3.1, y: 2.0), ChartDataEntry(x: 5.6, y: 3.0)]
        let values = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(10) + 3)
            return ChartDataEntry(x: Double(i), y: val, icon: #imageLiteral(resourceName: "icon"))
        }
        
        let set1 = LineChartDataSet(values: values1, label: "")
        set1.drawIconsEnabled = false
        
        //set1.lineDashLengths = [5, 2.5]
        // set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.lineWidth = 1
        set1.circleRadius = 0
        //set1.drawCircleHoleEnabled = false
        //set1.valueFont = .systemFont(ofSize: 9)
        //set1.formLineDashLengths = [5, 2.5]
        //set1.formLineWidth = 1
        //set1.formSize = 15
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
    }
    
     // MARK: - Table view data source
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 126.0
    }
}
