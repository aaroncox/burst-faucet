<!DOCTYPE html>
<html lang="en">
  <head>
    <title>BURST Faucet - burstcoin.info</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/uikit/2.11.1/css/uikit.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/uikit/2.11.1/css/uikit.almost-flat.min.css">
    <style>
      a {
        color: #2ecc71;
      }
      a:hover {
        color: #27ae60;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">
      <div class="uk-grid">

        <div class="uk-width-1-1 uk-text-center">
          <h1 class="uk-heading-large">BURST Faucet</h1>
          <p class="uk-text-large uk-margin-large-bottom">Fill out the Captcha and enter your BURST address to get between {{ config.faucet.amountToSendLow }} and {{ config.faucet.amountToSendHigh }} BURST for free.</p>
        </div>

      </div>

      {% block content %}{% endblock %}

    </div>
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/uikit/2.11.1/js/uikit.min.js"></script>
  </body>
</html>