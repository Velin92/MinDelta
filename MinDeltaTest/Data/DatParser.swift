//
//  FootballGameParser.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 08/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

enum ParserError: Error {
    case fileNotFound
}

protocol Parser {
    func parseFootballTeams(from bundle: Bundle) throws -> [FootballTeamModel]
    func parseWeather(from bundle: Bundle) throws -> [WeatherDayModel]
}

class DatParser: Parser {
    
    func parseWeather(from bundle: Bundle) throws -> [WeatherDayModel] {
        guard let url = bundle.url(forResource: "weather", withExtension: "dat") else {
            throw ParserError.fileNotFound
        }
        let weatherData = try String(contentsOf: url, encoding: .utf8)
        let weatherDataLines = weatherData.split{$0.isNewline}
            .map(String.init)
        let results = weatherDataLines.compactMap(parseWeatherDay)
        return results
    }
    
    private func parseWeatherDay(from line: String) -> WeatherDayModel? {
        let lineElements = line.split(separator: " ", omittingEmptySubsequences: true)
        guard lineElements.count >= 3,
            let day = Int (lineElements[0]),
            let maxTemperature = Int(lineElements[1]),
        //since the original data has a min value with a *, this requires a little trick to actually filter only
        //not sure if inteded, an error, or a special character but for now I'll just use this trick on the third element
        //it just separates characters that are digits, and discards the non digits characters, and then joins them again.
            let minTemperature = Int(lineElements[2].components(separatedBy: CharacterSet.decimalDigits.inverted)
                .joined())
        else {
            return nil
        }
        return WeatherDayModel(day: day, maxTemperature: maxTemperature, minTemperature: minTemperature)
    }
    
    func parseFootballTeams(from bundle: Bundle = Bundle.main) throws -> [FootballTeamModel] {
        guard let url = bundle.url(forResource: "football", withExtension: "dat") else {
            throw ParserError.fileNotFound
        }
        let footballData = try String(contentsOf: url, encoding: .utf8)
        let footbalDataLines = footballData.split{$0.isNewline}
            .map(String.init)
            .filter({$0.contains(".")})
        let results = footbalDataLines.compactMap(parseFootballTeam)
        return results
    }
    
    private func parseFootballTeam(from line: String) -> FootballTeamModel? {
        let lineElements = line.split(separator: " ", omittingEmptySubsequences: true)
        guard lineElements.count >= 9, let scoredGoals = Int (lineElements[6]), let concededGoals = Int(lineElements[8]) else {
            return nil
        }
        return FootballTeamModel(name: String(lineElements[1]) , scoredGoals: scoredGoals, concededGoals: concededGoals)
    }
}
