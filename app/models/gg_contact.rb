class GgContact < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_article

  # Genera mensaje de error
  def get_error_message
    error_msg = ""
    
    self.errors.full_messages.each do |msg|
      if error_msg != ""
        error_msg << "<br>"
      end
      error_msg << msg
    end

    error_msg
  end
end
