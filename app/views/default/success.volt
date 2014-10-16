{% extends "layouts/default.volt" %}

{% block content %}
  <div class="uk-grid uk-container-center">

    <div class="uk-width-4-6 uk-push-1-6">

      <div class="uk-alert uk-alert-success uk-alert-large uk-responsive-width">

        <h2>Successfully sent {{ amount }} BURST to {{ address }}.</h2>
        <p>You may claim a random amount of BURST once every {{ timePerAddress }} days(s).</p>

      </div>

    </div>

  </div>
{% endblock %}