<?php

use Phalcon\Http\Client\Request;

class Burst_Api {

  public function __call($name, $params = array()) {
    $provider  = Request::getProvider();
    $provider->setBaseUri('http://127.0.0.1:8125/burst');
    $request = array(
      'requestType' => $name,
    );
    if(isset($params[0])) {
      $request = array_merge($request, $params[0]);
    }
    $response = $provider->post(false, $request);
    return json_decode($response->body);
  }

}