//
//  ViewController.swift
//  TodayExtension
//
//  Created by Liu Jingkai on 15/9/29.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit
import weatherDataKit

class ViewController: UIViewController {

    var weatherData = weatherDataLoad()
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBAction func refresh(sender: UIButton) {
        
        weatherData.dataload()
        
        lblCity.text = weatherData.dataCity
        lblTemp.text = weatherData.dataTemp
        lblTime.text = weatherData.dataCurrenTime
        
        let userDefault = NSUserDefaults(suiteName: "group.com.guadoo.todayextension")
        
        userDefault?.setObject(lblTime.text, forKey: "weather.time")
        userDefault?.setObject(lblTemp.text, forKey: "weather.temp")
        userDefault?.setObject(lblCity.text, forKey: "weather.city")
        
        userDefault?.synchronize()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherData.dataload()
        
        lblCity.text = weatherData.dataCity
        lblTemp.text = weatherData.dataTemp
        lblTime.text = weatherData.dataCurrenTime
        
        let userDefault = NSUserDefaults(suiteName: "group.com.guadoo.todayextension")
        
        userDefault?.setObject(lblTime.text, forKey: "weather.time")
        userDefault?.setObject(lblTemp.text, forKey: "weather.temp")
        userDefault?.setObject(lblCity.text, forKey: "weather.city")
        
        userDefault?.synchronize()
    }

}
