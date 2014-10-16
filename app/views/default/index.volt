{% extends "layouts/default.volt" %}

{% block content %}

  <form method="post">

    <div class="uk-grid uk-container-center">

      <div class="uk-width-1-1 uk-text-center">
        <h1 class=""></h1>
      </div>

      <div class="uk-width-1-1 uk-text-center">
        <h1 class="uk-heading-large">Burstcoin Faucet</h1>
        <p class="uk-text-large uk-margin-large-bottom">Fill out the Captcha and enter your burstcoin address to get between 1 and 3 burst for free.</p>
      </div>

      <div class="uk-width-2-6 uk-push-1-6">
        {{ recaptcha_get_html(config.recaptcha.public) }}
      </div>

      <div class="uk-width-2-6 uk-push-1-6 uk-form uk-form-stacked">

        <div class="uk-form-row uk-margin-bottom">
          <label for="address">Your BURST Address:</label>
          <input type="text" name="address" placeholder="BURST-XXXX-XXXX-XXXX-XXXXX" class="uk-width-1-1">
        </div>

        <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>"/>

        <div class="uk-form-row uk-margin-bottom">
          <input type="submit" class="uk-button uk-button-success" value="Claim Burst">
        </div>

      </div>

      <div class="uk-width-4-6 uk-pull-1-6 uk-text-center">
        <h2 class="uk-margin-large-top">This faucet runs on donations!</h2>
        <p class="uk-text-large uk-margin-large-bottom">This faucet is for those who need a little burst to get started. If you'd like to donate to the pool, please send burst to:</p>
        <h3>BURST-2XL5-BHKS-QVNM-2QYJC</h3>
      </div>

    </div>

  </form>

{% endblock %}