//
//  MELIButton.swift
//  ProductApp
//
//  Created by Bruno Fontes on 23/5/22.
//

import UIKit

class MELIButton : UIButton {

    override func layoutSubviews() {
       super.layoutSubviews()
       setup()
   }

   func setup() {
       self.clipsToBounds = true
       self.layer.cornerRadius = 15
       self.backgroundColor = .blueMELI
       self.tintColor = .yellowMELI
   }
}


