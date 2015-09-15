module Template
  def template(source_template, req_id)


    #changes the req_id into an integer
    code = req_id.to_s

    # grabs parts of the code and puts a dash in between
    altcode = code[0..4] + "-" + code[5..7]

    #replaces the %CODE% in string with code
    source_template.sub!("%CODE%", code)

    #replaces the %ALTCODE% with the new altcode
    source_template.sub!("%ALTCODE%", altcode)

    # This code finds the starting and ending indexes of the the % in %CODE%
    # and then replaces it with the req_id. This can all be done with the sub!
    # string function. This code also creates a string from the source_template
    # which is unncessary since the source_template is already a string.

    # template = String.new(source_template)
    # template_split_begin = template.index("%CODE%")
    # template_split_end = template_split_begin + 6
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # code = String.new(req_id)
    # template =
    #   String.new(template_part_one + code + template_part_two)



    # This bottom portion does the same thing as above for %ALTCODE%
    # This code looks really messy and seems unneccessary when it can be done
    # in one line

    # template_split_begin = template.index("%ALTCODE%")
    # template_split_end = template_split_begin + 9
    # template_part_one =
    #   String.new(template[0..(template_split_begin-1)])
    # template_part_two =
    #   String.new(template[template_split_end..template.length])
    # altcode = code[0..4] + "-" + code[5..7]
    # template_part_one + altcode + template_part_two
  end
end
