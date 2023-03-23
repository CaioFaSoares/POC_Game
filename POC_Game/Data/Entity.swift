//
//  Entity.swift
//  Investigation
//
//  Created by Caio Soares on 23/03/23.
//

import Foundation

protocol Entity {
    var healthPoints: Int { get set }
    var defensePoints: Int { get set }
}

class Player: Entity {
    var healthPoints: Int
    var defensePoints: Int
    var currentScore: Int? = 0
    
    var playerActions: [PlayerAction] = []
    
    init(healthPoints: Int, defensePoints: Int) {
        self.healthPoints = healthPoints
        self.defensePoints = defensePoints
    }
    
}

class Enemy: Entity {
    var healthPoints: Int
    var defensePoints: Int
    
    var enemyActions: [EnemyAction] = []
    
    internal init(healthPoints: Int, defensePoints: Int) {
        self.healthPoints = healthPoints
        self.defensePoints = defensePoints
    }
    
}
