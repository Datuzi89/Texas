//
//  ImageViewController.swift
//  Texas
//
//  Created by Xuezhu on 1/2/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let contentsOfURL = NSData(contentsOf: url as URL)
                DispatchQueue.main.async {
                    if url == self.imageURL{
                        if let imageDate = contentsOfURL {
                            self.image = UIImage(data: imageDate as Data)
                        } else {
                            self.spinner?.stopAnimating()
                        }
                    } else {
                        print("ignored data returned from url \(url)")
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var scrollVIew: UIScrollView!{
        didSet {
            scrollVIew.contentSize = imageView.frame.size
            scrollVIew.delegate = self
            scrollVIew.minimumZoomScale = 0.03
            scrollVIew.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollVIew?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollVIew.addSubview(imageView)
    }

    
    

    
}
