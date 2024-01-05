package fr.eni.encheres;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Regroupe les méthodes de conversion pour Date et Time.
 */
public class DateTimeConverter {

    public static String formatDate(String dateStr, SimpleDateFormat inputFormat, SimpleDateFormat outputFormat)
            throws ParseException {
        java.util.Date utilDate = inputFormat.parse(dateStr);
        Date date = new Date(utilDate.getTime());
        return outputFormat.format(date);
    }

    public static String formatHour(String heureStr) throws ParseException {
        LocalTime heure = convertStringToTime(heureStr);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        return heure.format(formatter);
    }

    public static LocalDate convertStringToLocalDate(String dateStr) throws DateTimeParseException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return LocalDate.parse(dateStr, formatter);
    }

    public static LocalTime convertStringToTime(String heureStr) throws ParseException {
        SimpleDateFormat heureFormat = new SimpleDateFormat("HH:mm", Locale.FRENCH);
        java.util.Date parsedTime = heureFormat.parse(heureStr);
        return LocalTime.ofInstant(parsedTime.toInstant(), TimeZone.getDefault().toZoneId());
    }
}