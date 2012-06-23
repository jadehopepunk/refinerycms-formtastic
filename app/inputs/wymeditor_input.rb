class WymeditorInput < Formtastic::Inputs::TextInput
  def input_html_options
    super.merge(:class => 'wymeditor widest', :rows => 20)
  end
end