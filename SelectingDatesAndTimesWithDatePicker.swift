//
//  SelectingDatesAndTimesWithDatePicker.swift
//  SwiftUIProject4
//
//  Created by Marko Zivanovic on 13.9.23..
//

import SwiftUI

struct SelectingDatesAndTimesWithDatePicker: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
//        DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//            .labelsHidden()
        DatePicker("Please enter the time and date", selection: $wakeUp, in: Date.now...)
          
    }
//    func exapmleDate() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//
//    }
}

struct SelectingDatesAndTimesWithDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SelectingDatesAndTimesWithDatePicker()
    }
}
