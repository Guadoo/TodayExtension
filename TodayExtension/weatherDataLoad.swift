//
//  weatherDataLoad.swift
//  TodayExtension
//
//  Created by Liu Jingkai on 15/10/8.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import Foundation

public class weatherDataLoad{
    
    public var dataCity: String = ""
    public var dataTemp: String = ""
    public var dataCurrenTime: String = ""
    
    
    public init () {
        
    }
    
    public func dataload() {
        //读取weather.com的北京地区天气数据
        var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
        var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        //读取数据赋值给json对象
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        //通过KV解析json对象
        var weatherInfo: AnyObject! = json.objectForKey("weatherinfo")
        var city: AnyObject! = weatherInfo.objectForKey("city")
        var temp: AnyObject! = weatherInfo.objectForKey("temp")
    
        //当前时间设置显示格式
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
        
        dataCity = city as! String
       
        dataTemp = "\(temp) C"
        
        dataCurrenTime = currentTime as String
    }
}