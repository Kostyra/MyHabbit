
import UIKit

//var habit:Habit?

public struct NewHabit {
    var timePicler = Date()
    var nameText = String()
    var colorPicler = UIColor()
    var trackCheckDates = [Date]()
}

var newHabitStore = NewHabit()

var habit = Habit(name: newHabitStore.nameText,
                            date: newHabitStore.timePicler,
                            trackDates: newHabitStore.trackCheckDates,
                  color: newHabitStore.colorPicler)

//var sectionCollectiom: Int 
//
//var a = newHabitStore.trackCheckDates
//
//print(a[0])

