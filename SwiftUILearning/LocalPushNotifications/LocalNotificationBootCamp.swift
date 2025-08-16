//
//  LocalNotificationBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 16/08/25.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This so easy"
        content.sound = .default
        content.badge = 1
        
        //Timer
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        // Calender
        var dateCompenents = DateComponents()
        dateCompenents.hour = 13
        dateCompenents.minute = 23
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                NotificationManager.instance.requestAuthorization()
            }, label: {
                Text("Request Permission")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
            })
            
            Button(action: {
                NotificationManager.instance.scheduleNotification()
            }, label: {
                Text("Schedule Notification")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
            })
            
            Button(action: {
                NotificationManager.instance.cancelNotification()
            }, label: {
                Text("Cancel Notification")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
            })
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    LocalNotificationBootCamp()
}
