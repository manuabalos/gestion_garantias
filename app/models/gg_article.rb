class GgArticle < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_file
  has_many :gg_contacts, :dependent => :destroy
  accepts_nested_attributes_for :gg_contacts

  validate :code_article_is_blank
  validate :name_provider_is_blank
  validate :guarantee_is_blank
  # validate :guarantee_is_number
  validate :ans_is_blank
  # validate :ans_is_number

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

  def code_article_is_blank
 	errors.add :base, l(:"article.error.validation_code_article_blank") if self.code_article.blank?
  end

  def name_provider_is_blank
 	errors.add :base, l(:"article.error.validation_name_provider_blank") if self.name_provider.blank?
  end

  def guarantee_is_blank
 	errors.add :base, l(:"article.error.validation_guarantee_blank") if self.guarantee.blank?
  end

  def ans_is_blank
 	errors.add :base, l(:"article.error.validation_ans_blank") if self.ans.blank?
  end

 #  def guarantee_is_number
 #  	errors.add :base, l(:"article.error.validation_guarantee_number") if self.guarantee.is_a? Integer
 #  end

 #  def ans_is_number
	# errors.add :base, l(:"article.error.validation_ans_number") if self.ans.is_a? Integer
 #  end
end
