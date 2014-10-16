{% extends "layouts/default.volt" %}

{% block content %}

  <form method="post">

    <div class="uk-grid uk-container-center">

      <div class="uk-width-4-10 uk-push-1-10">
        {{ recaptcha_get_html(config.recaptcha.public) }}
      </div>

      <div class="uk-width-4-10 uk-push-1-10 uk-form uk-form-stacked">

        <div class="uk-form-row uk-margin-bottom">
          <label for="address">Your BURST Address:</label>
          <input type="text" name="address" placeholder="BURST-XXXX-XXXX-XXXX-XXXXX" class="uk-width-1-1">
        </div>

        <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>"/>

        <div class="uk-form-row uk-margin-bottom">
          <input type="submit" class="uk-button uk-button-success" value="Claim Burst">
        </div>

      </div>

    </div>

  </form>

  <div class="uk-grid uk-container-center">

    <div class="uk-width-4-10 uk-push-1-10 uk-text-center">
      <h2 class="uk-margin-large-top">This faucet runs on donations!</h2>
      <p class="uk-text-large">This faucet is for those who need a little burst to get started. If you'd like to donate to the faucet, please send burst to:</p>
      <h3 class="uk-panel uk-panel-box">{{ config.faucet.address }}</h3>
    </div>

    <div class="uk-width-4-10 uk-push-1-10 uk-text-center">
      <h2 class="uk-margin-large-top">Current Balance</h2>
      <p class="uk-text-large">Below is the current balance of the faucet and if you'd like to see all of it's transaction history visit the <a href="http://burst.cryptoport.io/acc/BURST-2XL5-BHKS-QVNM-2QYJC">Block Explorer</a>.</p>
      <h3 class="uk-panel uk-panel-box">{{ balance }} BURST</h3>
    </div>

  </div>

{% endblock %}