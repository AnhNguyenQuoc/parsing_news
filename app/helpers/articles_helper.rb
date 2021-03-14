module ArticlesHelper
  include Pagy::Frontend

  def short_description_content(content)
    strip_tags_content = strip_tags(content).to_s.dup.gsub!(/(\n|\t|\r)/, " ")
    truncate(strip_tags_content, length: 60, separator: ' ')
  end

  def random_color
    ['pink', 'purple','blue', 'green'].sample
  end
end
