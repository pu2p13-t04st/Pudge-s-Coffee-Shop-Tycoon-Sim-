extends Node
## Handles repeatitive logic for numbers
## Like formating dates or currency

@export var current_date : int = Time.get_unix_time_from_datetime_string("1999-03-22")

var number_regex : RegEx = RegEx.create_from_string(r"\d(?=(\d{3})+(?!\d))")
var date_regex : RegEx = RegEx.create_from_string(r"\d{4}-\d{2}-\d{2}")


func format_date(date : int) -> String:
	var search : RegExMatch = date_regex.search(Time.get_datetime_string_from_unix_time(date))
	var convert_to_string : String = search.get_string()
	return convert_to_string.replace_char(45, 47)


func add_days(date : int, days : int) -> int:
	var seconds_per_day = 24 * 60 * 60
	date += days * seconds_per_day
	return date


func format_currency(value : float) -> String:
	var substitute : String = number_regex.sub("%.3f"%absf(value), "$0" + "\u002C", true)
	var prefix : String = ("\u002D" if value < 0.0 else "") + ("\u00A2" if value < 1.0 and value > -1.0 else "\u0024")
	return prefix + substitute


func format_float(value : float) -> String:
	var substitute : String = number_regex.sub("%.3f"%absf(value), "$0" + "\u002C", true)
	var prefix : String = ("\u002D" if value < 0.0 else "")
	return prefix + substitute


func format_int(value : int) -> String:
	var substitute : String = number_regex.sub("%.f"%absi(value), "$0" + "\u002C", true)
	var prefix : String = ("\u002D" if value < 0.0 else "")
	return prefix + substitute
