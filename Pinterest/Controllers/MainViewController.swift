//
//  MainViewController.swift
//  Pinterest
//
//  Created by Hanan on 12/16/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit
import DownloadManager

class MainViewController: UICollectionViewController {
    let downloader = Downloader()
    
    var basePinterestModel: [BaseDO] = [BaseDO]()
    let cellSizes: [CGFloat] = [180, 200, 220, 240, 290]
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(MainViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.darkGray
        
        return refreshControl
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        fetchData()
    }
    
    private func fetchData(isRefresh _: Bool = false) {
        let url = URLRequest(url: URL(string: Constant.Url.base)!)
        downloader.loadWith(urlRequest: url) { [weak self] data, _ in
            let decoder = JSONDecoder()
            do {
                guard let self = self  else {
                    return
                }
                let basePinterestModels = try decoder.decode([BaseDO].self, from: data)
                self.basePinterestModel = basePinterestModels
                self.collectionView?.reloadData()
            } catch {
                debugPrint("Error occurred")
            }
        }
    }
    
    private func setUI() {
        title = "Pinterest"
        collectionView?.register(PinterestCell.nib, forCellWithReuseIdentifier: PinterestCell.id)
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView?.addSubview(refreshControl)
    }
    
    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchData(isRefresh: true)
        refreshControl.endRefreshing()
    }
}

extension MainViewController {
    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return basePinterestModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinterestCell.id,
                                                            for: indexPath) as? PinterestCell else { return UICollectionViewCell() }
        
        cell.pinterestBase = basePinterestModel[indexPath.item]
        
        return cell
    }
}

// MARK: - PINTEREST LAYOUT DELEGATE

extension MainViewController: PinterestLayoutDelegate {
    func collectionView(_: UICollectionView, heightForPhotoAtIndexPath _: IndexPath) -> CGFloat {
        guard let size = cellSizes.randomElement() else {
            return 120
        }
        
        return size
    }
}
