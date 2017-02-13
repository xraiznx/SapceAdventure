//
//  SpaceAdventure.swift
//  SpaceAdventure
//
//  Created by Israel Hammon on 2/6/17.
//  Copyright © 2017 Your School. All rights reserved.
//

import Foundation
class SpaceAdventure
{
    let planetarySystem: PlanetarySystem // Declares planetarysystem
    
    init(planetarySystem: PlanetarySystem) // Initializes planetarysystem
    {
        self.planetarySystem = planetarySystem
    }
   
    private func displayIntroduction() // Prints program introduction
    {
        print("Welcome to the \(planetarySystem.name)!")
        print("There are \(planetarySystem.planets.count) planets to explore.")
        print(planetarySystem.planets)
    }
    private func responseToPrompt(prompt: String) -> String // Prompt function to accept input
    {
        print(prompt)
        return getln()
    }
    private func visit(planetName: String)
    {
        print("Traveling to \(planetName)...")
        for planet in planetarySystem.planets
        {
            if planetName == planet.name
            {
                print("Arrived at \(planet.name). \(planet.description)")
            }
        }
    }

    private func greetAdventurer() // Greets adventurer with prompt and print
    {
        let name = responseToPrompt(prompt: "What is your name?")
        print("Nice to meet you, \(name). My name is Eliza, I'm an old friend of Siri.")
    }
    private func determineDestination() // Determines destination based on user input
    {
        var decision = "" // Start with empty String
        decision = responseToPrompt(prompt: "Shall I randomly choose a planet  for you to visit? (Y or N)")
        if decision == "Y"
        {
            if let planet = planetarySystem.randomPlanet
            {
                visit(planetName: planet.name)
            }
            else
            {
                print("Sorry, but there are no planets in this system.")
            }
        }
        else if decision == "N"
        {
            var num = 1
            while true
            {
                
                let planetName = responseToPrompt(prompt: "Ok, name the planet you would  like to visit.")
                for i in planetarySystem.planets
                {
                    print(i.name)
                    if planetName == i.name
                    {
                        self.visit(planetName: planetName)
                        num = 2
                        break
                    }

                }
                if num == 2
                {
                    break
                }
            }
        }
        else
        {
            print("Sorry, I didn't get that.")
            determineDestination()
        }
    }
    func start()
    {
        displayIntroduction()
        greetAdventurer()
        if (!planetarySystem.planets.isEmpty)
        {
            print("Let's go on an adventure!")
            determineDestination()
        }
    }
}

