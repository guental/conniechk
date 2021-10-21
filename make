#!/bin/sh
{
dir=""
case "${0}" in
	*"/"*)
		dir="${0%"/"*}/"
	;;
esac
if ! [ -s "${dir}conniechk" ]; then
	if cat -- "${dir}shell" "${dir}db.tbz2" > "${dir}conniechk" 2>/dev/null; then
		if chmod +x -- "${dir}conniechk" 2>/dev/null; then
			echo "make: conniechk: OK"
		else
			echo "make: conniechk: FAILED"
			exit 1
		fi
	else
		echo "make: conniechk: FAILED"
		exit 1
	fi
fi
}
