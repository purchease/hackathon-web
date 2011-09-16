module ApplicationHelper
  
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
    content_for(:title) { @content_for_title }
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:stylesheet) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:javascript) { javascript_include_tag(*args) }
  end
  
  def shorten(string, count = 30)
   unless string.nil?
     if string.length >= count 
      shortened = string[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
     else 
      string
     end
   end
  end
  
  def timeago(time, options = {})
     start_date = options.delete(:start_date) || Time.new
     date_format = options.delete(:date_format) || :default
     delta_minutes = (start_date.to_i - time.to_i).floor / 60
     if delta_minutes.abs <= (8724*60)       
       distance = distance_of_time_in_words(delta_minutes)       
       if delta_minutes < 0
          return "#{distance} from now"
       else
          return "#{distance} ago"
       end
     else
        return "on #{DateTime.now.to_formatted_s(date_format)}"
     end
   end
   
   def distance_of_time_in_words(minutes)
     case
       when minutes < 1
         "less than a minute"
       when minutes < 50
         pluralize(minutes, "minute")
       when minutes < 90
         "about one hour"
       when minutes < 1080
         "#{(minutes / 60).round} hours"
       when minutes < 1440
         "one day"
       when minutes < 2880
         "about one day"
       else
         "#{(minutes / 1440).round} days"
     end
   end

  def format_notifications(notifications)
    msg= ''
    notifications.each do |notification|
      msg += "<p><a href='#{notification.url}'>#{notification.message}</a></p>"
    end
    msg
  end
end
