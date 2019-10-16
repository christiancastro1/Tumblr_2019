//
//  PhotoViewController.swift
//  Tumblr_2019
//
//  Created by Christian Alexander Valle Castro on 10/13/19.
//  Copyright © 2019 valle.co. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Mark:-  properties
    
    @IBOutlet weak var tableView: UITableView!
    var posts : [[String : Any]] = []// array of dictionaries key is string and value can be anything. dont reallly know what api might send

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    // Mark - private functions
    
    private func retrievePost (){
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate:nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url){(data,response,error ) in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                let responseDictionary = dataDictionary["response"] as! [String : Any]
                self.posts = responseDictionary["posts"] as! [[String : Any]]
                
              //  print(self.posts.count) dont really need this for now
               
                // TODO: Reload the table view
            }
    }
        task.resume()
}
    //Mark - UIViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count  // number of post -- for each post one row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as! PhotoCell
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let original_size = post["original_size"] as! [String :Any]
            let urlString = original_size["url"] as! String  // we're just getting the a string url
            let url = URL(string: urlString)  // that string above has to be change to an actual url
            
        }
       
        
        
        
        return cell
    }
     
    
    
}
