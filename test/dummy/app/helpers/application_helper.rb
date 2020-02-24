module ApplicationHelper
  def beautify html_string
    HtmlBeautifier.beautify html_string.strip.gsub('>', ">\n").gsub('<', "\n<")
  end

  def render_source args={}
    #@html_encoder ||= HTMLEntities.new
    #raw(@html_encoder.encode(render args))

    partial_file_path = "app/views/forms/_#{args[:partial]}.html.erb"
    partial_file_content = File.read(partial_file_path)

    beautify partial_file_content.strip.gsub('>', ">\n").gsub('<', "\n<")
  end

  def render_out args={}
    #@html_encoder ||= HTMLEntities.new
    #HtmlBeautifier.beautify(raw(@html_encoder.encode(render args).html_safe.strip.gsub('>', ">\n").gsub('<', "\n<"))).html_safe

    beautify((render args).strip.gsub('>', ">\n").gsub('<', "\n<"))
  end
end
