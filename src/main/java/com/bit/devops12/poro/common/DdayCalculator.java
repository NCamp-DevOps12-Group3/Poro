package com.bit.devops12.poro.common;

import net.sf.cglib.core.Local;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DdayCalculator {

    String resultDday = null;

    // 인스타용 dday 계산기
    public String getDdayCalculator(LocalDateTime regdate) {

        // 현재 시간
        LocalDateTime presentTime = LocalDateTime.now();

        // ★ 남은 일수 계산(dday 계산기)
        long totalDays = ChronoUnit.DAYS.between(regdate.toLocalDate(), presentTime.toLocalDate());
        long minute = ChronoUnit.MINUTES.between(regdate, presentTime) % 60;
        long hour = ChronoUnit.HOURS.between(regdate, presentTime) % 24;
        long days = totalDays % 7;
        long weeks = totalDays / 7;
        long totalMonths = ChronoUnit.MONTHS.between(regdate.toLocalDate(), presentTime.toLocalDate());
        long totalYears = ChronoUnit.YEARS.between(regdate.toLocalDate(), presentTime.toLocalDate());

        if (totalYears <= 0 && totalMonths <= 0 && weeks <= 0 && days <= 0 && hour <= 0 && minute < 0) {
            return null;
        } else if (totalYears == 0 && totalMonths == 0 && weeks == 0 && days == 0 && hour == 0 && minute == 0) {
            // 1분 이내(결과값: 지금)
            resultDday = "지금";
        } else if (totalYears == 0 && totalMonths == 0 && weeks == 0 && days == 0 && hour == 0 && minute >= 0) {
            // 1시간 이내(결과값: 00분)
            resultDday = minute + "분전";
        } else if (totalYears == 0 && totalMonths == 0 && weeks == 0 && days == 0 && hour >= 0) {
            // 1일 이내(결과값: 00시간전)
            resultDday = hour + "시간전";
        } else if (totalYears == 0 && totalMonths == 0 && weeks == 0 && days >= 0) {
            // 1주 이내(결과값: 00일전)
            resultDday = days + "일전";
        } else if (totalYears == 0 && totalMonths == 0 && weeks >= 0) {
            // 1달 이내(결과값: 00주전)
            resultDday = weeks + "주전";
        } else if (totalYears == 0 && totalMonths >= 0) {
            resultDday = totalMonths + "달전";
        } else if (totalYears >= 0) {
            resultDday = totalYears + "년전";
        }

        return resultDday;

    }

     // 사람인용 dday 계산기
    public String getDdayRed(LocalDateTime regdate){

        String[] dDayVals = regdate.toLocalDate().toString().split("-");

        String[] currTimeVals = LocalDateTime.now().toLocalDate().toString().split("-");
        long totalDays = ChronoUnit.DAYS.between(
                LocalDateTime.of(Integer.parseInt(currTimeVals[0]), Integer.parseInt(currTimeVals[1]), Integer.parseInt(currTimeVals[2]), 0, 0, 0),
                LocalDateTime.of(Integer.parseInt(dDayVals[0]), Integer.parseInt(dDayVals[1]), Integer.parseInt(dDayVals[2]), 0, 0, 0));


        if(totalDays < 0) return "D+"+(-1 * totalDays);
        else if(totalDays == 0) return "D-Day";
        else return "D-" + totalDays;
    }

    public String getDdayRed(String dDay){
        String[] dDayVals = dDay.split("-");

        String[] currTimeVals = LocalDateTime.now().toLocalDate().toString().split("-");
        long totalDays = ChronoUnit.DAYS.between(
                LocalDateTime.of(Integer.parseInt(currTimeVals[0]), Integer.parseInt(currTimeVals[1]), Integer.parseInt(currTimeVals[2]), 0, 0, 0),
                LocalDateTime.of(Integer.parseInt(dDayVals[0]), Integer.parseInt(dDayVals[1]), Integer.parseInt(dDayVals[2]), 0, 0, 0));

        if(totalDays < 0) return "D+"+(-1 * totalDays);
        else if(totalDays == 0) return "D-Day";
        else return "D-" + totalDays;

    }
}
