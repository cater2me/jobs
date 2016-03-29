module Template
  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    template = substitute_code(template, req_id, "%CODE%")

    # all of the bloated code here was unnecessary. I've replaced it with substitute_code.

    # Substitute for %ALTCODE%
    altcode = req_id[0..4] + "-" + req_id[5..7]
    substitute_code(template, altcode,"%ALTCODE%")
  end

  # It's basically syntactic sugar at this point to have as its own method.
  # gsub is a very concise way to replace certain contents of a string.
  def substitute_code(template, new_value, target_string)
    template.gsub(/#{target_string}/, new_value)
  end
end
