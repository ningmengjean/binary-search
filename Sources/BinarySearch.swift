//Solution goes in Sources
import Foundation

enum BinarySearchError: Error {
    case unsorted
}

class BinarySearch {
    
    var list: [Int]
    
    init(_ list: [Int]) throws{
        if list != list.sorted() {
            throw BinarySearchError.unsorted
        } else {
            self.list = list
        }
    }
    
    var middle: Int {
        return Int((list.count - 1)/2)
    }
    
    func searchFor(_ key: Int) -> Int? {
        if key == list[middle] {
            return middle
        } else if key < list[middle] {
            if let element = list[0...middle].filter({key == $0}).first {
                return list.index(of: element)
            } else {
                return nil
            }
        } else if key > list[middle] {
            if let element = list[middle...list.count-1].filter({key == $0}).first {
                return list.index(of: element)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
