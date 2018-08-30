package com.easy.auction.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class practice {
	public static void main(String[] args) {
		adminComment();
	}
	
	public static void adminComment() {
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		System.out.println(hour + ":" + minute + ":" + second);
		
		System.out.println("-------");
		
		Date date = cal.getTime();
		String today = new SimpleDateFormat("HH:mm").format(date);
		System.out.println(today);
		
		String[] todaySplit = today.split(":");
		int[] numberToday = {Integer.parseInt(todaySplit[0]), Integer.parseInt(todaySplit[1])};
		System.out.println(numberToday[0] + ", " + numberToday[1]);
		
		if(today.equals("23:14")) {
			System.out.println(true);
		} else {
			System.out.println(false);
		}
		
		
	}
	
}
