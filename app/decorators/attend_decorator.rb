class AttendDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def line_class
    return "info" if object.status == Attend::Status::In
    return "warning" if object.status == Attend::Status::Out
  end

  def log_at
    return "部室" if object.log_at == Attend::LogAt::CircleRoom
    return "演習室" if object.log_at == Attend::LogAt::SeminarRoom
  end

  def status
    return "退室" if object.status == Attend::Status::Out
    return "入室" if object.status == Attend::Status::In
  end

  def date
    object.date.strftime("%Y-%m-%d(#{%w(日 月 火 水 木 金 土)[object.date.wday]}) %H:%M:%S")
  end
end
