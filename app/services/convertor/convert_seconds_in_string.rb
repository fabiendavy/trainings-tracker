module Convertor
  class ConvertSecondsInString
    def self.call(seconds)
      if seconds <= 59
        return "00:00:#{seconds}"
      elsif seconds > 59 && seconds <= 3599
        minutes = seconds / 60
        final_seconds = seconds % 60
        minutes = minutes < 10 ? "0#{minutes}" : "#{minutes}"
        final_seconds = final_seconds < 10 ? "0#{final_seconds}" : "#{final_seconds}"
        return "#{minutes}:#{final_seconds}"
      elsif seconds > 3599
        hours = seconds / 3600
        minutes = (seconds % 3600) / 60
        final_seconds = seconds % 60
        hours = hours < 10 ? "0#{hours}" : "#{hours}"
        minutes = minutes < 10 ? "0#{minutes}" : "#{minutes}"
        final_seconds = final_seconds < 10 ? "0#{final_seconds}" : "#{final_seconds}"
        return "#{hours}:#{minutes}:#{final_seconds}"
      end
    end
  end
end
