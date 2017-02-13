//
//  PlanetarySystem.swift
//  SpaceAdventure
//
//  Created by Israel Hammon on 2/7/17.
//  Copyright © 2017 Your School. All rights reserved.
//

import Foundation
class PlanetarySystem
{
    var randomPlanet: Planet?
    {
        if planets.isEmpty
        {
            return nil
        }
        else
        {
            let index = Int(arc4random_uniform(UInt32(planets.count))) // Creates random number between  1 - 8
            return planets[index] // Returns planet
        }
    }
    
    let name: String
    let planets: [Planet]
    
    init(name: String, planets: [Planet])
    {
        self.name = name
        self.planets = planets
    }

}
