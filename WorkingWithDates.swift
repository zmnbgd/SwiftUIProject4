//
//  WorkingWithDates.swift
//  SwiftUIProject4
//
//  Created by Marko Zivanovic on 14.9.23..
//

import SwiftUI

struct WorkingWithDates: View {
    var body: some View {
        //Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    func trivialExample() {
//        var components = DateComponents()
//        components.hour = 9
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date.now
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
    }
}

struct WorkingWithDates_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithDates()
    }
}
