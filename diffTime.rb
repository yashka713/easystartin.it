def diff_time(f_time, s_time)

  f_time = f_time.to_i.abs
  s_time = s_time.to_i.abs

  if f_time == s_time
    return 'the same date'
  elsif f_time >= s_time
    @max_time = f_time
    @min_time = s_time
  else
    @max_time = s_time
    @min_time = f_time
  end

  @time_difference_in_unix = @max_time - @min_time

  @day=@time_difference_in_unix/(60*60*24)
  @hour=(@time_difference_in_unix - @day*24*60*60)/(60*60)
  @minutes=(@time_difference_in_unix - @day*24*60*60 - @hour*60*60)/60
  @seconds=@time_difference_in_unix - @day*24*60*60 - @hour*60*60 - @minutes*60

  private
  def sec(sec)
    if sec==0
      sec=''
    elsif (@day==''||@day==0)&&(@hour==''||@hour==0)&&(@minutes==' '||@minutes==0)
      sec= normalize_time(sec.to_s + ' second')
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

  def normalize_min(minutes)
    if minutes.to_i>=1
      minutes=minutes.to_s + ' min'
    else
      minutes=''
    end
  end

 normalize_time(@day.to_s + ' day') + ' ' +
     normalize_time(@hour.to_s + ' hour') + ' ' +
     normalize_min(@minutes.to_s) +
     sec(@seconds)
end

puts diff_time(1478779622, '1478779621')