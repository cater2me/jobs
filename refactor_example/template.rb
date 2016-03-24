module Template
  def template(source_template, req_id)
    template = String.new(source_template)



    template = substitute_code(template, req_id, "%CODE")


    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    code = String.new(req_id)

    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end

  # Substitute for %CODE%
  # this should be its own method
  def substitute_code(template, req_id, target_string)
    template_split_begin = template.index(target_string)
    template_split_end = template_split_begin + target_string.length
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    String.new(template_part_one + code + template_part_two)
  end
end
