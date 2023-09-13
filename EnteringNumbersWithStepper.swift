//
//  EnteringNumbersWithStepper.swift
//  SwiftUIProject4
//
//  Created by Marko Zivanovic on 13.9.23..
//

import SwiftUI

struct EnteringNumbersWithStepper: View {
    
    @State private var sleeepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleeepAmount.formatted()) hours", value: $sleeepAmount, in: 4...12, step: 0.25)
    }
}

struct EnteringNumbersWithStepper_Previews: PreviewProvider {
    static var previews: some View {
        EnteringNumbersWithStepper()
    }
}
