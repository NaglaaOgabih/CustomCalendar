//
//  CustomDashView.swift
//  Celemore
//
//  Created by Omar Adel on 7/13/20.
//  Copyright © 2020 Omar Adel. All rights reserved.
//

import UIKit

class CustomDashedView: UIView {

    @IBInspectable var corner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = corner
            layer.masksToBounds = corner > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0

    var dashBorder: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if corner > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: corner).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}
