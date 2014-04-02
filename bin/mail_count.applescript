set output_string to ""
tell application "Mail"
	set Unread_Count to unread count of inbox
	if Unread_Count is 0 then
		set output_string to "-"
	else
		set output_string to ("" & (get Unread_Count) & "")
	end if
end tell
return output_string