package dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class NewClass {

    public static void main(String[] args) {

        SimpleDateFormat df = new SimpleDateFormat("MMM yyyy");
        Date start = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(start);
        c.add(Calendar.YEAR, -1);
        Date befo = c.getTime();
        System.out.println(df.format(befo));

    }
}
//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date date = new Date();
//        System.out.println("Current Date " + dateFormat.format(date));
//
//        // Convert Date to Calendar
//        Calendar c = Calendar.getInstance();
//        c.setTime(date);
//
//        // Perform addition/subtraction
//        c.add(Calendar.YEAR, 2);
//
//        // Convert calendar back to Date
//        Date currentDatePlusOne = c.getTime();
//
//        System.out.println("Updated Date " + dateFormat.format(currentDatePlusOne));
