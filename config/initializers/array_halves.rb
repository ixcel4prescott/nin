class Array

  def first_half
    slice( 0,length/2 )
  end

  def second_half
    slice( length/2, length-1 )
  end

end