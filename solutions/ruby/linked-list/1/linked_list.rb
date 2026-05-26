class Deque < Array
  def delete(elem)
    delete_at(index(elem)) if index(elem)
  end
end