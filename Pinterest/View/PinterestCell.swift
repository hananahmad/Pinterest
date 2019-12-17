//
//  PinterestCell.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit
import DownloadManager

class PinterestCell: UICollectionViewCell {
    @IBOutlet var containerView: UIView!
    @IBOutlet var imageView: UIImageView!
    let downloader = Downloader()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
           containerView.layer.masksToBounds = true
    }
    
    var pinterestBase: BaseDO? {
        didSet {
            if let pinterestBase = pinterestBase, let urls = pinterestBase.urls, let thumb = urls.regular, let url = URL(string: thumb) {
                let request = URLRequest(url: url)
                downloader.loadWith(urlRequest: request) { [weak self] data, _ in
                    self?.imageView.image = UIImage(data: data, scale: 1.0)
                }
            }
        }
    }
}
