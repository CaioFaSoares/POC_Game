//
//  Action.swift
//  Investigation
//
//  Created by Caio Soares on 23/03/23.
//

import Foundation

protocol Action {
    var isTargetingPlayer: Bool { get }
    var isHealing: Bool { get }
    var actionName: String { get }
}

class PlayerAction: Action {
    var isTargetingPlayer: Bool
    var isHealing: Bool
    var actionName: String
    
    var actionValue: Int
    var actionCooldown: Int?
    
    init(isTargetingSelf: Bool, isHealing: Bool, actionValue: Int = 0, actionCooldown: Int? = 0, actionName: String = "Default Debug Name for Player Action") {
        self.isTargetingPlayer = isTargetingSelf
        self.isHealing = isHealing
        self.actionValue = actionValue
        self.actionCooldown = actionCooldown
        self.actionName = actionName + "| \(String(describing: actionValue)) damage!"
    }
}

class EnemyAction: Action {
    var isTargetingPlayer: Bool
    var isHealing: Bool
    var actionName: String
    
    var actionValue: Int
    
    
    init(isTargetingSelf: Bool, isHealing: Bool, actionValue: Int = 0, actionName: String = "Default Debug Name for Enemy Action") {
        self.isTargetingPlayer = isTargetingSelf
        self.isHealing = isHealing
        self.actionName = actionName
        self.actionValue = actionValue
    }
}

class EnviromentalAction: Action {
    var isTargetingPlayer = true
    var isHealing: Bool
    var actionName: String
    
    var actionValue: Int?
    
    init(isTargetingSelf: Bool = true, isHealing: Bool, actionValue: Int? = nil, actionName: String = "Default Debug Name for Enviromental") {
        self.isTargetingPlayer = isTargetingSelf
        self.isHealing = isHealing
        self.actionName = actionName
        self.actionValue = actionValue
    }
    
}
