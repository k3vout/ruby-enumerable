module MyEnumerable
  def all?(&block)
    result = nil
    self.each.with_index do |element, idx|
      result = block.call(element) if idx == 0
      result = result && block.call(element) if idx != 0
    end
    result
  end
  
  def any?(&block)
    result = nil
    self.each.with_index do |element, idx|
      result = block.call(element) if idx == 0
      result = result || block.call(element) if idx != 0
    end
    result
  end
  
  def filter(&block)
    result = []
    self.each do |element|
      result << element if block.call(element) == true
    end
    result
  end
end