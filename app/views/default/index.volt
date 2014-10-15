{% extends "layouts/default.volt" %}

{% block content %}
  <form method="post">

    {{ recaptcha_get_html(config.recaptcha.public) }}

    <label for="address">BURST Address (BURST-XXXX-XXXX-XXXX-XXXX):</label>
    <br>
    <input type="text" name="address">

    <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>"/>

    <input type="submit">

  </form>
{% endblock %}