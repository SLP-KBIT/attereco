class MemberDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def status
    return "在室" if object.status == Member::Status::InRoom
    return "退室" if object.status == Member::Status::BeOut
  end

  def next_action
    return "退室" if object.status == Member::Status::InRoom
    return "入室" if object.status == Member::Status::BeOut
  end

  def status_message
    member = object.decorate
    member.name + "さんは" + member.status + "中です."
  end

  def button_class
    return "btn-info" if object.status == Member::Status::BeOut
    return "btn-warning" if object.status == Member::Status::InRoom
  end
end
