//
//  Date.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/11.
//

import Foundation
extension Date{
    func toString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            return dateFormatter.string(from: self)
    }
}
