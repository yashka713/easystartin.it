def diff_time(f_time, s_time)

  f_time, s_time = f_time.abs, s_time.abs

  if f_time >= s_time
    @max_time = f_time
    @min_time = s_time
  else
    @max_time = s_time
    @min_time = f_time
  end

  @timeDifferenceInUnixTime = @max_time - @min_time

  @day=@timeDifferenceInUnixTime/(60*60*24)
  @hour=(@timeDifferenceInUnixTime - @day*24*60*60)/(60*60)
  @minutes=(@timeDifferenceInUnixTime - @day*24*60*60 - @hour*60*60)/60
  @seconds=@timeDifferenceInUnixTime - @day*24*60*60 - @hour*60*60 - @minutes*60

  private
  def sec(sec)
    if sec==0
      sec=''
    else
      sec=' and ' + normalize_time(sec.to_s + ' second')
    end
  end

  def normalize_time(time_val)
    if time_val.to_i>1
      time_val=time_val.to_s + 's'
    elsif time_val.to_i==0
      time_val=''
    else
      time_val
    end
  end

 normalize_time(@day.to_s + ' day') + ' ' +
     normalize_time(@hour.to_s + ' hour') + ' ' +
     @minutes.to_s + ' min' +
     sec(@seconds)
end

puts diff_time(1478779200, 1478786400)