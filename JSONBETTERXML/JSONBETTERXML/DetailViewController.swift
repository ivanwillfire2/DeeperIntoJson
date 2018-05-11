//
//  DetailViewController.swift
//  JSONBETTERXML
//
//  Created by Ivan Anyaegbu on 5/11/18.
//  Copyright © 2018 Ivan Anyaegbu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var witle: UILabel!
    @IBOutlet weak var yStart: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var ep: UILabel!
    @IBOutlet weak var studio: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var castcss: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = self.witle {
                label.text = detail.name
                self.navigationItem.title = detail.name
                self.navigationItem.titleView?.tintColor = UIColor.yellow
            }
            if let label = self.yStart {
                label.text = detail.yearStart
                if let test = detail.yearEnd{
                    label.text = detail.yearStart + "-"+test
                }
            }
            if let label = self.format {
                label.text = detail.format
            }
            if let label = self.studio {
                var temp = ""
                //label.text =  detail.network!
                if let test = detail.network{
                    temp += test
                }
                if let test2 = detail.studio{
                    temp += test2
                }
                label.text = temp
            }
            if let label = self.ep {
                
                if let test = detail.episodesCount{
                    label.text = "Episodes: " + String(test);
                }
                else{
                    label.text = "Episode: 1";
                }
            }
            if let label = self.castcss {
                label.tintColor = UIColor.red
            }
            if let label = self.summary {
                label.text = detail.showDescription
            }
            if let label = self.desc {
                label.text = detail.showSummary
            }
            if let label = self.image{
                let url = URL(string: detail.imageURL)
                
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        label.image = UIImage(data: data!)
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: DataObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

