class Util::Validate
  #code
  def isBlank text
    if text.empty? || text.nil?
      true
    else
      false
    end
    #code
  end
  def isNotBlank text
    if text.empty? || text.nil?
      false 
    else
      true
    end
    #code
  end
end
