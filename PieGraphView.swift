//
//  PieGraphView.swift
//  
//
//  Created by Strat Aguilar on 9/22/16.
//
//

import UIKit


class PieGraph: UIView{
  
  var pie: Pie
  let colorArray = [UIColor.blue, UIColor.green, UIColor.red, UIColor.yellow, UIColor.purple]
  
  init(frame: CGRect, pie: Pie) {
    self.pie = pie
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  override func draw(_ rect: CGRect) {
    let ovalRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
    
    var startAngle: CGFloat = 0
    var endAngle: CGFloat = 0
    
    for (index, piece) in pie.pieces.enumerated(){
      let ovalPath = UIBezierPath()
      startAngle = endAngle
      
      endAngle = (piece.value / pie.total) * 2 * CGFloat(M_PI) + endAngle
      ovalPath.addArc(withCenter: CGPoint.zero, radius: ovalRect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
      ovalPath.addLine(to: CGPoint.zero)
      ovalPath.close()
      
      var ovalTransform = CGAffineTransform(translationX: ovalRect.midX, y: ovalRect.midY)
      ovalTransform = ovalTransform.scaledBy(x: 1, y: ovalRect.height / ovalRect.width)
      
      ovalPath.apply(ovalTransform)
      
      let color = colorArray[index % colorArray.count]
      
      color.setFill()
      ovalPath.fill()
      
      
    }
  }
  
}
