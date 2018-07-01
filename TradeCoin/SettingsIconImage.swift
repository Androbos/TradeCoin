//
//  SettingsIconImage.swift
//  TradeCoin
//
//  Created by otto on 7/1/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import Foundation

extension UIImageView {
    func tintImageColor(color : UIColor) {
        self.image = self.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.tintColor = color
    }
}
