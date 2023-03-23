//
//  main.swift
//  POC_Game
//
//  Created by Caio Soares on 23/03/23.
//

import Foundation

print("Hi, welcome to the CLI version of Chickens!")
print("Initializing the player character...")
print("How many health points will you have?")
let initialHp: Int = Int(readLine()!)!
print("How many defense points will you have?")
let initialDp: Int = Int(readLine()!)!

var player = Player(healthPoints: initialHp, defensePoints: initialDp)

var action1 = PlayerAction(isTargetingSelf: false, isHealing: false,
    actionValue: 2,
    actionCooldown: 1,
    actionName: "Basic Attack! "
)

var action2 = PlayerAction(isTargetingSelf: true, isHealing: false,
    actionValue: 2,
    actionCooldown: 2,
    actionName: "Self Laceration! "
)

var action3 = PlayerAction(isTargetingSelf: true, isHealing: true,
    actionValue: 2,
    actionCooldown: 1,
    actionName: "Golden Egg Hunt! "
)

player.playerActions.append(action1)
player.playerActions.append(action2)
player.playerActions.append(action3)


print("Your character has been initialized! Your actions are...")
for action in player.playerActions {
    print(action.actionName)
}

var enemyHP: Int = 6
var enemyDP: Int = 1

var enemy = Enemy(healthPoints: enemyHP, defensePoints: enemyDP)
var enemyAction1 = EnemyAction(isTargetingSelf: false, isHealing: false, actionValue: 3)
var enemyAction2 = EnemyAction(isTargetingSelf: false, isHealing: false, actionValue: 6)

enemy.enemyActions.append(enemyAction1)
enemy.enemyActions.append(enemyAction2)

var combat = true

while combat == true {
    var turn = true
    while turn == true {
        print("You have \(player.healthPoints) health points!")
        print("Your enemy is a evil alien chicken! He has \(enemy.healthPoints) health points!")
        print("Which action will you do?")
        
        let input: Int = Int(readLine()!)!
        switch input {
        case 1:
            enemy.healthPoints -= player.playerActions[0].actionValue - enemy.defensePoints
        case 2:
            player.healthPoints -= player.playerActions[1].actionValue
        case 3:
            player.healthPoints += player.playerActions[2].actionValue
        default:
            print("invalid!")
        }
        
        print("It's now the evil alien chicken turn!")
        let enemyTurn = Int.random(in: 1...2)
        switch enemyTurn {
        case 1:
            print("He's attacking!")
            player.healthPoints -= enemy.enemyActions[0].actionValue - player.defensePoints
        case 2:
            print("He's attacking...but stronger!")
            player.healthPoints -= enemy.enemyActions[1].actionValue - player.defensePoints
        default:
            print("invalid!")
        }
        
        turn = false
    }
}
