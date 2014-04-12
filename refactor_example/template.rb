#module Template
  def change(source_template, req_id)
    #template = String.new(source_template) ##No need because source_tempalte is being passed as a string

    # Substitute for %CODE%
    source_template.gsub!(/%CODE%/,req_id)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end
#end



 p change('Code is %CODE%; alt code is %ALTCODE%', '5678901234') == 'Code is 5678901234; alt code is 56789-012'
