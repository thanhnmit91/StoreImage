//
//  VCViewModel.swift
//  StoresImage
//
//  Created by administrator on 11/18/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

class VCViewModel: NSObject {

    
    
}


extension VCViewModel: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    
}
