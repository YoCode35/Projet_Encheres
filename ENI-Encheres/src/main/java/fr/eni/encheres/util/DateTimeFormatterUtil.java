package fr.eni.encheres.util;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

//Classe pour l'affichage des dates et des heures formatées pour les pages .jsp

public class DateTimeFormatterUtil 
{

    public static String formatLocalDate(LocalDate date, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return date.format(formatter);
    }

    public static String formatLocalTime(LocalTime time, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return time.format(formatter);
    }
}