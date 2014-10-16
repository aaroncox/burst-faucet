{% extends "layouts/default.volt" %}

{% block content %}
  <div class="uk-grid uk-container-center">

    <div class="uk-width-4-6 uk-push-1-6 uk-container-center">

      <div class="uk-alert uk-alert-danger uk-alert-large uk-responsive-width">
  
        <h2>An error has occured!</h2>
        <p>{{ error }}</p>

      </div>

    </div>

  </div>
{% endblock %}