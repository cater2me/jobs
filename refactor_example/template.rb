module Template
  def template(source_template, req_id)

    template_array = source_template.split('%')
    # if the positions of %CODE% and %ALTCODE% never change, it should be
    # template_array[1] = req_id
    # template_array[3] = req_id[0..4] + '-' + req_id[5..7]
    template_array[ template_array.index("CODE") ]    = req_id
    template_array[ template_array.index("ALTCODE") ] = req_id[0..4] + '-' + req_id[5..7]
    template_array.join()

  end
end
