{% extends "layouts/default.volt" %}

{% block content %}
  <h2>Successfully sent {{ amount }} BURST to {{ address }}.</h2>
  <p>You may claim BURST once every {{ timePerAddress }} hour(s).</p>
{% endblock %}