//
//  ViewController.swift
//  LearnChartsStackedBarChart
//
//  Created by Jing Wang on 1/18/18.
//  Copyright © 2018 Jing Wang. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    let chartView = BarChartView()
    let chartViewWidth:CGFloat = 300
    let chartViewHeight:CGFloat = 480
    var drawTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        chartView.frame = CGRect(x: view.bounds.midX - chartViewWidth/2, y: view.bounds.midY - chartViewHeight/2, width: chartViewWidth, height: chartViewHeight)
        chartView.backgroundColor = UIColor.red
        
        drawTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(firstDraw), userInfo: nil, repeats: false)
        //        firstDraw()
        self.view.addSubview(chartView)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func firstDraw() {
        self.chartView.backgroundColor = UIColor.clear
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        let unitsBought = [10.0, 14.0, 60.0, 13.0, 2.0, 1.0, 5.0, 1.0, 12.0, 14.0, 15.0, 14.0]
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<months.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [unitsSold[i], unitsBought[i]])
            dataEntries.append(dataEntry)
        }
        
        let set = BarChartDataSet(values: dataEntries, label: "Statistics Vienna 2014")
        set.colors = [UIColor.red, UIColor.green]
        
        let data = BarChartData(dataSet: set)
        
        self.chartView.data = data
        
    }
    
}

