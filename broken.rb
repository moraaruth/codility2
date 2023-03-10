def broken(str)
    # Split the string into an array of elements
    elements = str.split(" ")
    # Initialize variables for tracking the current and expected values
    current_value = 0
    expected_value = 1
    missing_value = nil
    # Loop through the elements and check each one
    elements.each do |element|
      # Check if the element is a valid number
      if !element.match(/^\d+$/)
        return 1 # Invalid input
      end
      # Convert the element to an integer
      value = element.to_i
      # Check if the value is the next expected value in the sequence
      if value == expected_value
        expected_value += 1
      elsif value > current_value
        missing_value ||= expected_value
      end
      # Update the current value
      current_value = value
    end
    # Return the appropriate result based on the values tracked during the loop
    if missing_value.nil?
      return 0 # Complete sequence
    else
      return missing_value # Incomplete sequence
    end
  end
  result = broken("1 2 4 3")
  puts result # Output: 0
  result = broken("1 2 a")
  puts result # Output: 1
  result = broken("1 2 4")
  puts result # Output: 3
  result = broken("1 5")
  puts result # Output: 2