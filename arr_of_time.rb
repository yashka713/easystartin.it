def arr_time(date_string)

  def do_function(plus_time, counter, variable)
    (0..counter).each do
      variable=variable.to_i + plus_time
      @transform_at=Time.at(variable)
      @normalise=@transform_at.strftime('%a, %d %b %Y %H:%M:%S')
      @res_arr.push(@normalise.to_s)
    end
    variable
  end

  @res_arr=Array.new
  @res_arr.push(date_string)
  months={'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'June' => 6, 'July' => 7, 'Aug' => 8, 'Sept' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12}

  date_string=date_string.split(' ')
  time= date_string[4].to_s.split(':')

  months.each_key { |mounth|
    if date_string[2].to_s==mounth
      @mounth=months[mounth]
    end }

  @unix_time=Time.local(date_string[3].to_i, @mounth, date_string[1].to_i, time[0].to_i, time[1].to_i, time[2].to_i)
  do_function(86400, 4, do_function(3600, 6, do_function(1800, 7, do_function(900, 3, @unix_time))))

  @res_arr
end

puts arr_time('Thu, 22 Dec 2016 15:25:36')
