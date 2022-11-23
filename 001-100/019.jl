isLeapYear(y) = y%4==0 && (y%100!=0 || y%400==0)

# 12 - 1
monthDays = [31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]

# 1900. 12. 1
weekday = 1 + ((365-31) % 7)
count = 0

for year=1901:2000
    for month=1:12
        global weekday = (weekday + monthDays[month]) % 7

        if month==3 && isLeapYear(year)
            global weekday = (weekday + 1) % 7
        end

        if weekday == 0
            global count += 1
        end
    end
end

println(count)
