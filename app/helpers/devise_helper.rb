module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = <<-HTML
    <div id="error_explanation">
      <p>MEGATRON FATAL EЯЯOR#145: ой!</p>
      <p>Заполните все поля корректно. Логин должен быть в 4-16 символа, а пароль правильно подтвержденным. А если все верно, значит такой логин или почта уже заняты. Быть может вы забыли пароль?</p>
    </div>
    HTML

    html.html_safe
  end
end