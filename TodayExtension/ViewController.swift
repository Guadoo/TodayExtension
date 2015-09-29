//
//  ViewController.swift
//  TodayExtension
//
//  Created by Liu Jingkai on 15/9/29.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLoad()
        
        
    }

    func dataLoad(){
        
        var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
        
        var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        var weatherInfo: AnyObject! = json.objectForKey("weatherinfo")
        
        var city: AnyObject! = weatherInfo.objectForKey("city")
        var temp: AnyObject! = weatherInfo.objectForKey("temp")
        
        
        lblCity.text = (city as! String)
        lblTemp.text = (temp as! String) + "℃"
        
        var timeNow = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var comps = calendar.components(NSCalendarUnit.HourCalendarUnit|NSCalendarUnit.MinuteCalendarUnit, fromDate: timeNow)
        
        var currentTime = ""
        if comps.hour >= 10 && comps.minute >= 10{
            currentTime = "\(comps.hour):\(comps.minute)"
        }else if comps.hour >= 10{
            currentTime = "\(comps.hour):0\(comps.minute)"
        }else if comps.minute >= 10{
            currentTime = "0\(comps.hour):\(comps.minute)"
        }else{
            currentTime = "0\(comps.hour):0\(comps.minute)"
        }
        
        lblTime.text = currentTime
        
        let userDefault = NSUserDefaults(suiteName: "group.com.guadoo.todayextension")
        
        userDefault?.setObject(lblTime.text, forKey: "weather.time")
        userDefault?.setObject(lblTemp.text, forKey: "weather.temp")
        userDefault?.setObject(lblCity.text, forKey: "weather.city")
        
        userDefault?.synchronize()
    }

}
