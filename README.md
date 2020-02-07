# AnalyticsTrackingExample

This example app is used to demonstrate creating an Analytics tracking architecture that is 
- Testable 
- Scalable 
- Isolated 

My blog post https://proteinandprogramming.com/combining-multiple-analytics-trackers-into-one-using-enum-case-paths/ goes more in detail as to what is going on. 

In order to accomplish these goals I created a few trackers in there on frameworks to demonstrate isolation. 
The trackers have tests coverage in each framework. 

I then imported these trackers into a main app that then composes each tracker together using enum case paths. This allowed me to easily add or remove trackers demonstrating that it can be easily scaled. 

I then added an example test to the app target to demostrate how easy it is to test the app's tracking logic. 

Interesting files to look at: 

AnalyticsTracker.swift: https://github.com/aj-bartocci/AnalyticsTrackingExample/blob/master/AnalyticsTracker/AnalyticsTracker.swift

Analytics.swift: https://github.com/aj-bartocci/AnalyticsTrackingExample/blob/master/Analytics/Analytics.swift

AnalyticsTests.swift: https://github.com/aj-bartocci/AnalyticsTrackingExample/blob/master/AnalyticsTests/AnalyticsTests.swift

GoogleAnalyticsTracker.swift: https://github.com/aj-bartocci/AnalyticsTrackingExample/blob/master/GoogleAnalyticsTracker/GoogleAnalyticsTracker.swift

GoogleAnalyticsTrackerTests.swift: https://github.com/aj-bartocci/AnalyticsTrackingExample/blob/master/GoogleAnalyticsTrackerTests/GoogleAnalyticsTrackerTests.swift
