//
//  ViewController.swift
//  SunriseTime
//
//  Created by vigneswaran on 04/09/17.
//  Copyright © 2017 vigneswaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCityName: UITextField!
    @IBOutlet weak var labSunTime: UILabel!
    @IBOutlet weak var labTittle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSunriseTime(_ sender: Any) {
        
        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(txtCityName.text!)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        loadURL(url: url)
    }
    
    @IBAction func btnSunsetTime(_ sender: Any) {
        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(txtCityName.text!)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        loadURL1(url: url)
    }
    func loadURL(url: String){
        do{
            let appURL = URL(string:url)!
            let data = try Data(contentsOf:appURL)
            let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
            let query = json["query"] as! [String:Any]
            let results = query["results"] as! [String:Any]
            let channel = results["channel"] as! [String:Any]
            let astronomy = channel["astronomy"] as! [String:Any]
            labSunTime.text = "Sunrise time is \(astronomy["sunrise"]!)"
            labTittle.text = "\(channel["title"]!)"
        }catch{
            labSunTime.text = "cannot fetch sunrise time"
        }
    }
    func loadURL1(url: String){
        do{
            let appURL = URL(string:url)!
            let data = try Data(contentsOf:appURL)
            let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
            let query = json["query"] as! [String:Any]
            let results = query["results"] as! [String:Any]
            let channel = results["channel"] as! [String:Any]
            let astronomy = channel["astronomy"] as! [String:Any]
            labSunTime.text = "Sunset time is \(astronomy["sunset"]!)"
            labTittle.text = "\(channel["title"]!)"
        }catch{
            labSunTime.text = "cannot fetch sunset time"
        }
    }
    
}

