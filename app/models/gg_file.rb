class GgFile < ActiveRecord::Base
  unloadable

  has_many :gg_articles
  # validates :identity_file, presence: { :message => "El identidicador del expediente no puede estar vacío." }
  validate :identity_file_is_blank
  validate :code_file_is_blank

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

  private
  # Valida que el campo del numero de identidad del expediente no se encuentre vacio.
  def identity_file_is_blank
  	 errors.add :base, l(:"file.error.validation_indentity_file_blank") if self.identity_file.blank?
  end

  # Valida que el campo del código del expediente no este vacio.
  def code_file_is_blank
     errors.add :base, l(:"file.error.validation_code_file_blank") if self.code_file.blank?
  end

end
