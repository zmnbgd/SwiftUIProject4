//
//  ContentView.swift
//  SwiftUIProject4
//
//  Created by Marko Zivanovic on 12.9.23..
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    //@State private var wakeUp = Date.now
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: Challenge 1. - Replace each VStack in our form with a Section, where the text view is the title of the section. Do you prefer this layout or the VStack layout? It’s your app – you choose!
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please ented the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                //MARK: Challenge 2. - Replace the “Number of cups” stepper with a Picker showing the same range of values.
                Section {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//
//                    Stepper(coffeeAmount == 1 ? "1 Cup" : "\(coffeeAmount) Cups", value: $coffeeAmount, in: 1...20)
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    }
                Section(header: Text("Your recommended bed time is...")) {
                    Text(calculateBedTime())
                        .font(.title).bold()
                        .foregroundColor(Color(UIColor.systemBlue))
                }
            }
            .navigationTitle("Better Rest")
//            .toolbar {
//                 Button("Calculate", action: calculateBedtime)
//            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Okey") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
//    func calculateBedtime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60
//            let minute = (components.minute ?? 0) * 60 * 60
//
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//
//            let sleepTime = wakeUp - prediction.actualSleep
//            alertTitle = "Your ideal bed time is "
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem in calculating your bed time"
//
//        }
//        showingAlert = true
//    }
    //MARK: Challenge 3. - Change the user interface so that it always shows their recommended bedtime using a nice and large font. You should be able to remove the “Calculate” button entirely.
    func calculateBedTime() -> String {
            let model = SleepCalculator()

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            do {
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                let sleepTime = wakeUp - prediction.actualSleep

                let formatter = DateFormatter()
                formatter.timeStyle = .short

                return formatter.string(from: sleepTime)
            } catch {
                return "Sorry, there was a problem calculating your bedtime."
            }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
