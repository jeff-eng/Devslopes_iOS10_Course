//
//  DelegateProtocol.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 3/1/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

protocol PokemonSelectionVCDelegate: class {
    
    func didDismissCollectionView(sender: PokemonSelectionVC, selected: Pokemon)
}
