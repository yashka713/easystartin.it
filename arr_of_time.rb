def arr_time(date_string) # функція, що повертає масив часу від заданої дати до 5 днів

  def do_function(plus_time, counter, variable) # функція обробки дат
    (0..counter).each do
      variable=variable.to_i + plus_time
      @transform_at=Time.at(variable)
      @normalise=@transform_at.strftime('%a, %d %b %Y %H:%M:%S') #нормалізація дат, до зрозумілого людині вигляду
      @res_arr.push(@normalise.to_s)
    end
    variable # повернення останньої обробленої дати, потрібно, щоб наступний період часу знав, з якого часу почати відлік
  end

  @res_arr=Array.new
  # хеш місяців, потрібен для визначення номеру місяця за порядком
  months={'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'June' => 6, 'July' => 7, 'Aug' => 8, 'Sept' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12}
  # блок розбиття початкової дати на елементи масиву, комфортні для обробки
  date_string=date_string.split(' ')
  time= date_string[4].to_s.split(':')

  months.each_key { |mounth|
    if date_string[2].to_s==mounth
      @mounth=months[mounth]
    end }
  # формування першого елементу масиву кінцевих даних
  @unix_time=Time.local(date_string[3].to_i, @mounth, date_string[1].to_i, time[0].to_i, time[1].to_i, time[2].to_i)
  # виклик функцій обробки дат
  do_function(86400, 4, do_function(3600, 6, do_function(1800, 7, do_function(900, 3, do_function(0, 0, @unix_time)))))

  @res_arr
end

puts arr_time('Thu, 22 Dec 2016')