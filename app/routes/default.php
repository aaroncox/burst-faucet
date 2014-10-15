<?php

function get_ip_address() { foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){if (array_key_exists($key, $_SERVER) === true){foreach (explode(',', $_SERVER[$key]) as $ip){$ip = trim($ip); if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){return $ip;}}}}return 'unknown';}

$app->get('/', function() use($app) {
  // Render out the HTML
  echo $app->view->render('default/index');
});

$app->post('/', function() use($app) {
  if(!$app->security->checkToken()) {
    throw new Exception("CSRF Token Validation Failed");
  }

  // Attempt to retreive the user's IP address
  $ipaddress = get_ip_address();

  // Check against the CAPTCHA field
  $challenge = $app->request->get('recaptcha_challenge_field');
  $response = $app->request->get('recaptcha_response_field');
  $resp = recaptcha_check_answer($app->config->recaptcha->private, $ipaddress, $challenge, $response);

  // Invalid Captcha Response? Throw an error
  if(!$resp->is_valid) {
    throw new Exception("Invalid Captcha Entry");
  }

  // Requested Address for Faucet
  $address = $app->request->get("address");

  // Has this address recieved coins too soon?
  if($app->redis->get($address)) {
    throw new Exception("This burst address has received coins too recently.");
  }

  // Has this ip address requested coins too soon?
  if($app->redis->get($ipaddress)) {
    throw new Exception("This IP address has requested coins too recently.");
  }

  // Determine how much to send
  $amountToSend = rand($app->config->faucet->amountToSendLow, $app->config->faucet->amountToSendHigh);

  // Process the Request
  $burst = new Burst_Api();
  $data = array(
    'recipient' => $address,
    'deadline' => $app->config->burst->deadline,
    'secretPhrase' => $app->config->burst->secretPhrase,
    'feeNQT' => $app->config->burst->feeNQT,
    'amountNQT' => $amountToSend,
  );
  $response = $burst->sendMoney($data);

  if($response && $response->errorCode) {
    throw new Exception("There was an error processing the request. Please ensure the address entered is correct.");
  }

  // Store the BURST Address for configured time
  $app->redis->set($address, time());
  $app->redis->setTimeout($address, $app->config->faucet->timePerAddress);

  // Store the IP Address for configured time
  $app->redis->set($ipaddress, time());
  $app->redis->setTimeout($address, $app->config->faucet->timePerIP);

  // Render out the HTML
  echo $app->view->render('default/success', array(
    'amount' => round($amountToSend / 100000000, 3),
    'address' => $address,
    'timePerAddress' => $app->config->faucet->timePerAddress / 86400,
  ));
});