//
//  PhotoViewController.swift
//  stretchTest
//
//  Created by 陳博軒 on 2020/2/2.
//  Copyright © 2020 Bozin. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var photoName: String?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoName = photoName {
            imageView.image = UIImage(named: photoName)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
