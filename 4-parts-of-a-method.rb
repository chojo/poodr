# The four parts of a method
# I believe that if we take a look at any given line of code in a method, we can nearly
# always categorize it as serving one of the following roles:
# 1. Collecting input
# 2. Performing work
# 3. Delivering output
# 4. Handling failures
# (There are two other categories that sometimes appear: "diagnostics", and "cleanup".
# But these are less common.)

def location(item, value)
  sub_table = get_sub_table(item, value)
  if(sub_table.length==0)
    raise MetricFu::AnalysisError, "The #{item.to_s} '#{value.to_s}' " "does not have any rows in the analysis table"
  else
    first_row = sub_table[0]
    case item
    when :class
      MetricFu::Location.get(first_row.file_path, first_row.class_name, nil)
    when :method
      MetricFu::Location.get(first_row.file_path, first_row.class_name, first_row.method_name)
    when :file
      MetricFu::Location.get(first_row.file_path, nil, nil)
    else
      raise ArgumentError, "Item must be :class, :method, or :file"
    end
  end
end

# The point I want to draw your attention to in breaking down the method in this way
# is that the different parts of the method are mixed up. Some input is collected; then
# some error handling; then some more input collection; then work is done; and so
# on.
# This is a defining characteristic of "un-confident", or as I think of it, "timid code":
# the haphazard mixing of the parts of a method. Just like the confused adventure
# story earlier, code like this puts an extra cognitive burden on the reader as they

