module ApplicationHelper
  def controller_name_index_path(param)
    "?filter=#{param}"
  end
end
