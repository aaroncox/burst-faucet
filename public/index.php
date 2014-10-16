<?php
defined('APPLICATION_ENV') || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));
defined('APPLICATION_PATH') || define('APPLICATION_PATH', realpath(dirname(__FILE__) . "/../app/"));

$app = new Phalcon\Mvc\Micro();
$app->notFound(function () use ($app) {
  echo $app->view->render('default/404');
});

require_once("../vendor/autoload.php");
require_once("../libs/recaptcha.php");

$di = new Phalcon\DI\FactoryDefault();

$di->setShared('session', function() {
  $session = new Phalcon\Session\Adapter\Files();
  $session->start(array(
    'uniqueId' => 'burstfaucet'
  ));
  return $session;
});

$di->setShared('config', function() {
  require_once(APPLICATION_PATH . "/configs/default.php");
  $config = new \Phalcon\Config($configData);
  return $config;
});

$di->set('voltService', function($view, $di) {
  $volt = new Phalcon\Mvc\View\Engine\Volt($view, $di);
  $volt->setOptions(array(
    "compileAlways" => true,
    "compiledPath" => "../app/storage/views/",
  ));
  $compiler = $volt->getCompiler();
  $compiler->addFunction('implode', 'implode');
  $compiler->addFunction('explode', 'explode');
  $compiler->addFunction('recaptcha_get_html', 'recaptcha_get_html');
  return $volt;
});

$di->set('view', function(){
  $view = new \Phalcon\Mvc\View\Simple();
  $view->setViewsDir('../app/views/');
  $view->registerEngines(array(
    ".volt" => 'voltService'
  ));
  return $view;
});

$di->set('redis', function(){
  $redis = new Redis();
  $redis->connect('localhost', 6379);
  return $redis;
});

$loader = new \Phalcon\Loader();
$loader->registerClasses(
  array(
    'Burst_Api' => APPLICATION_PATH . '/../libs/Burst/Api.php',
  )
);
$loader->register();

$app->setDI($di);

require_once(APPLICATION_PATH . "/routes.php");

try {
  $app->handle();
} catch (\Exception $e) {
  echo $app->view->render('default/500', array(
    'error' => $e->getMessage()
  ));
}
