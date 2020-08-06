module Convertor
  class ConvertStringInSeconds
    def self.call(string)
      regex_with_hours = /\A(?<hours>\d{2})\:(?<minutes>[0-5][0-9])\:(?<seconds>[0-5][0-9])\z/

      if string =~ regex_with_hours
        match = string.match(regex_with_hours)

        hours_in_seconds = (match[:hours].to_i) * 3600
        minutes_in_seconds = (match[:minutes].to_i) * 60
        seconds = match[:seconds].to_i

        total = hours_in_seconds + minutes_in_seconds + seconds
      end
    end
  end
end
