class Util::Validate
  #code
  def isBlank text
    if text.nil? || text.empty?
      true
    else
      false
    end
    #code
  end
  def isNotBlank text
    if text.nil? || text.empty?
      false
    else
      true
    end
    #code
  end
end
