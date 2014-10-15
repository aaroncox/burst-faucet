BURSTCOIN Faucet
---

A BURSTCOIN Faucet written using Phalcon, Volt, Redis and the native BURSTCOIN API.

###Requirements:
- [PHP](http://php.net)
- [Phalcon 1.3](http://phalconphp.com/en/)
- [Redis](http://redis.io/)
- [PHP Redis Extension](https://packages.debian.org/sid/php5-redis) (apt-get install php5-redis)
- [Composer](https://getcomposer.org/)
- [BURSTCOIN](http://burstcoin.info/) (Currently required to be running on 127.0.0.1:8125)

###Setup:
- Copy `app/configs/default.template` to `app/configs/default.php`.
- Edit `app/configs/default.php` and fill in the appropriate values.
- Ensure that `app/storage/views` is writable by the web server.
- Run `composer install` to install dependancies.

###Important Files:
- `app/configs/default.php` contains all of your settings for redis, burstcoin and the faucet itself.
- `app/routes/default.php` contains simple logic for processing all get/post requests.
- `app/views/index.volt` is the default page displayed when you load the page.
- `app/views/success.volt` is the page loaded upon successful distribution of burstcoin.
- `app/views/layouts/default.volt` is the global layout file

Feel free to contribute to the source or donate to development!

- BURSTCOIN: BURST-GWTA-TKGU-QZG4-5PPQ6
- Bitcoin: 1GZqZsNoeeLmVLs77HuQRJ5efVT76eG1Fh
- OneName.io: [https://onename.io/aaroncox](https://onename.io/aaroncox)