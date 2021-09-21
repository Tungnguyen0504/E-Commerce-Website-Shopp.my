/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author tungn
 */
public class NewClass {

    public static void main(String[] args) {
        try {
            long millis = System.currentTimeMillis();
            Timestamp now = new Timestamp(millis);
            Timestamp past = Timestamp.valueOf("2018-09-01 09:01:15");

            System.out.println(TimeUnit.MILLISECONDS.toMillis(now.getTime() - past.getTime()) + " milliseconds ago");
            System.out.println(TimeUnit.MILLISECONDS.toMinutes(now.getTime() - past.getTime()) + " minutes ago");
            System.out.println(TimeUnit.MILLISECONDS.toHours(now.getTime() - past.getTime()) + " hours ago");
            System.out.println(TimeUnit.MILLISECONDS.toDays(now.getTime() - past.getTime()) + " days ago");
        } catch (Exception j) {
            j.printStackTrace();
        }
    }

}
