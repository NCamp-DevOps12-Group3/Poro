package com.bit.devops12.poro.common;

import java.time.LocalDateTime;

public class testDday {

    public static void main(String[] args){
        LocalDateTime regdate = LocalDateTime.of(2024, 8, 3, 7, 38);

        DdayCalculator ddayCalculator = new DdayCalculator();

        String result = ddayCalculator.getDdayCalculator(regdate);

        System.out.println(result);
    }
}
