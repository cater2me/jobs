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

  def substitute_code(template, code_str, code)
    split_idx = template.index(code_str)
    split_jdx = split_idx + code_str.size

    template_part_one = template[0..(split_idx-1)]
    template_part_two = template[split_jdx..template.length]
    template_part_one + code + template_part_two
  end
end
