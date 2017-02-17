module Template
  def template(source_template, req_id)
    template = source_template
    code = req_id
    altcode = code[0..4] + "-" + code[5..7]

    # Substitute for %CODE%
    template = substitute_code(template, '%CODE%', code)

    # Substitute for %ALTCODE%
    template = substitute_code(template, '%ALTCODE%', altcode)

    template
  end

  # This is the biggest refactoring decision, extracting a method for
  # the duplicate logic present in substituting codes into the string.

  # I came to this point after removing seemingly excessive String.new calls,
  # re-arranging lines of code, and seeing the logic better.

  # At this point I'd like to know if this kind of optimization is appropriate
  # If we should consider doing a dangerous mutation on the source_template
  # and discuss more optimizations such as changing the template in fewer passes.

  def substitute_code(template, code_str, code)
    split_idx = template.index(code_str)
    split_jdx = split_idx + code_str.size

    template_part_one = template[0..(split_idx-1)]
    template_part_two = template[split_jdx..template.length]
    template_part_one + code + template_part_two
  end
end
