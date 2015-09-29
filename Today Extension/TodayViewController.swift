//
//  TodayViewController.swift
//  Today Extension
//
//  Created by Liu Jingkai on 15/9/29.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = NSUserDefaults(suiteName: "group.com.guadoo.todayextension")
        
        let city: String = userDefault?.objectForKey("weather.city") as! String
        let time: String = userDefault?.objectForKey("weather.time") as! String
        let temp: String = userDefault?.objectForKey("weather.temp") as! String
    
        lblCity.text = city
        lblTemp.text = temp
        lblTime.text = time
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
