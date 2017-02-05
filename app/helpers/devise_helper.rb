module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = <<-HTML
    <div id="error_explanation">
      <p>MEGATRON FATAL EЯЯOR#145 Ой! Заполните все поля корректно. Логин должен быть больше 4-х символов, а пароль правильно подтвержденным.</p>
    </div>
    HTML

    html.html_safe
  end
end