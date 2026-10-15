extends Node

@export var current_date : int = Time.get_unix_time_from_datetime_string("1999-03-22")


func format_date(date : int) -> String:
	return RegEx.create_from_string(r"\d{4}-\d{2}-\d{2}").search(Time.get_datetime_string_from_unix_time(date)).get_string().replace_char(45, 47)

func add_days(days : int) -> int:
	current_date += days * (24 * 60 * 60)
	return current_date

func format_currency(value : float) -> String:
	return ("\u002D" if value < 0.0 else "") + ("\u00A2" if value < 1.0 and value > -1.0 else "\u0024") + RegEx.create_from_string(r"\d(?=(\d{3})+(?!\d))").sub("%.3f"%absf(value), "$0" + "\u002C", true)

func format_float(value : float) -> String:
	return ("\u002D" if value < 0.0 else "") + RegEx.create_from_string(r"\d(?=(\d{3})+(?!\d))").sub("%.3f"%absf(value), "$0" + "\u002C", true)

func format_int(value : int) -> String:
	return ("\u002D" if value < 0.0 else "") + RegEx.create_from_string(r"\d(?=(\d{3})+(?!\d))").sub("%.f"%absi(value), "$0" + "\u002C", true)
