extends Node
## Handles repeatitive logic for numbers
## Like formating dates or currency


# Holds The Games Current Date
@export var current_date : int = Time.get_unix_time_from_datetime_string("1999-03-22")

# Reusable Regexes
var number_regex : RegEx = RegEx.create_from_string(r"\d(?=(\d{3})+(?!\d))")
var date_regex : RegEx = RegEx.create_from_string(r"\d{4}-\d{2}-\d{2}")

# Converts Dates From Strings To Unix Time
func date_to_int(date : String) -> int:
	return Time.get_unix_time_from_datetime_string(date)

# Converts Unix Time To Strings And Removes The Time Stamp
func date_to_string(date : int) -> String:
	var date_time_string : String = Time.get_datetime_string_from_unix_time(date)
	var search : RegExMatch = date_regex.search(date_time_string)
	return search.get_string()

# Replaces The "-"s In Date Time Strings With "/"s
# Why? Because Idk I Liked It Better
func format_date_string(date : int) -> String:
	var search : RegExMatch = date_regex.search(date_to_string(date))
	var convert_to_string : String = search.get_string()
	return convert_to_string.replace_char(45, 47)

# Adds Any Amount Of Days To Any Date (Unix Time) You Put In It
func add_days(date : int, days : int) -> int:
	var seconds_per_day = 24 * 60 * 60
	date += days * seconds_per_day
	return date

# Formats Floats To My Hearts Content (1000 = $1,000.000, 10 = $10.000, 1 = $01.000)
func format_currency(value : float) -> String:
	var substitute : String = number_regex.sub(
			"%.3f"%absf(value), "$0" + "\u002C", true).pad_zeros(2)
	var prefix : String = ("\u002D" if value < 0.0 else "") + (
			"\u00A2" if value < 1.0 and value > -1.0 else "\u0024")
	return prefix + substitute

# Formats Floats Again But Without The Dopamine Symbol (1000 = 1,000.000, 10 = 10.000) 
# The Three Decimals Are Neccessary Gas Stations Do It So I Can Too
func format_float(value : float) -> String:
	var substitute : String = number_regex.sub(
			"%.3f"%absf(value), "$0" + "\u002C", true).pad_zeros(2)
	var prefix : String = ("\u002D" if value < 0.0 else "")
	return prefix + substitute

# Formats Intergers (1000 = 1,000, 10 = 10, 1 = 01)
func format_int(value : int) -> String:
	var substitute : String = number_regex.sub(
			"%.f"%absi(value), "$0" + "\u002C", true).pad_zeros(2)
	var prefix : String = ("\u002D" if value < 0.0 else "")
	return prefix + substitute
