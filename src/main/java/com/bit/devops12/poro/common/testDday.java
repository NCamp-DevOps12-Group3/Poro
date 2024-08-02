package com.bit.devops12.poro.common;

import java.time.LocalDateTime;

public class testDday {

    public static void main(String[] args){
        LocalDateTime regdate = LocalDateTime.of(2024, 7, 2, 9, 48);

        DdayCalculator ddayCalculator = new DdayCalculator();

        String result = ddayCalculator.getDdayCalculator(regdate);

        System.out.println(result);
    }
}
