def convert_minutes(total_minutes):
    """Convert minutes into human readable hours & minutes."""
    hours = total_minutes // 60
    minutes = total_minutes % 60

    if hours > 1:
        hour_text = "hrs"
    else:
        hour_text = "hr"

    return f"{hours} {hour_text} {minutes} minutes"


# ---- Test ----
print(convert_minutes(130))   # Output: 2 hrs 10 minutes
print(convert_minutes(110))   # Output: 1 hr 50 minutes
print(convert_minutes(59))    # Output: 0 hr 59 minutes
