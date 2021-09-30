module MyEnumerable
  def all?
    result = nil
    @list.each.with_index do |element, idx|
      result = yield(element) if idx.zero?
      result &&= yield(element) if idx != 0
    end
    result
  end

  def any?
    result = nil
    @list.each.with_index do |element, idx|
      result = yield(element) if idx.zero?
      result ||= yield(element) if idx != 0
    end
    result
  end

  def filter
    result = []
    @list.each do |element|
      result << element if yield(element) == true
    end
    result
  end
end
