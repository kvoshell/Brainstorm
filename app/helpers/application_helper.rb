module ApplicationHelper
  def controller_name_index_path(param)
    "index?filter=#{param}"
  end
end
