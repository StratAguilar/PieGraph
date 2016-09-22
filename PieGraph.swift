//
//  PieGraph.swift
//  
//
//  Created by Strat Aguilar on 9/22/16.
//
//

import Foundation


struct Pie{
  let pieces: [PiePiece]
  let total: CGFloat
  
  init(pieces: [PiePiece]){
    self.pieces = pieces
    
    var computedTotal: CGFloat = 0
    
    for piece in pieces{
      computedTotal += piece.value
    }
    self.total = computedTotal
  }
}
