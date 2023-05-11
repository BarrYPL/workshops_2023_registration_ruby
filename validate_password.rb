class ValidatePassword
  def initialize(argPasswd)
    @passwd = argPasswd
  end

  def perform
    check_length
  end

  def check_length
    if @passwd.length.between?(6,24) then check_for_great_letter else return false end
  end

  def check_for_great_letter
    if @passwd.match?(/[A-Z]/) then check_for_small_letter else return false end
  end

  def check_for_small_letter
    if @passwd.match?(/[a-z]/) then check_for_number else return false end
  end

  def check_for_number
    if @passwd.match(/[0-9]/) then check_for_specials else return false end
  end

  def check_for_specials
    specials = ['!','@','#','$','%','&','*','+','=',':',';','?','<','>']
    hasSpecials = false
    @passwd.split('').uniq.each do |char|
      hasSpecials = true if specials.include? char.to_s
    end
    if hasSpecials
      check_for_triple_chars
    else
      return false
    end
  end

  def check_for_triple_chars
    puts @passwd
    @passwd.split('').uniq.each do |char|
      if @passwd["#{char}#{char}#{char}"]
        return false
      end
    end
    return true
  end

end
