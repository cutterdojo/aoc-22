import UIKit

/// UTILITIES
func load(file: String, extension: String = "txt") -> String {
    guard
        let fileHandle = Bundle.main.url(forResource: file, withExtension: `extension`),
        let content = try? String(contentsOf: fileHandle) else {
        return ""
    }
    
    return content
}

/// DAY 1
func day1Part1() -> Int {
    let elves = load(file: "aoc_day1").split(separator: "\n\n")
    var maxElf = 0
    elves.forEach {
        let total = $0.split(separator: "\n").compactMap({ Int($0) }).reduce(0, +)
        maxElf = max(total, maxElf)
    }
    
    return maxElf
}

print(day1Part1())

func day1Part2() -> Int {
    let elves = load(file: "aoc_day1").split(separator: "\n\n")
    
    let elfCalories = elves.map {
        $0.split(separator: "\n").compactMap({ Int($0) }).reduce(0, +)
    }
    
    return elfCalories.sorted(by: >).prefix(3).reduce(0, +)
}

print(day1Part2())
