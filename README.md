# Decade of Movies App

The past decade held a lot of movies, some left a mark and some were just a set of 24-60 pictures per second. I would like you to showcase those movies and the signature they left behind.

## Architecture

* The current architecture is MVP with Use case and Repository flavors plus Factory design pattern for DataStoreFactory
* The app is using enums and structs with protocols as applying for Protocol Oriented Programming as Apple recommends.
* The app is depending on generics in the Model layers.
* The app is depending on the Result pattern.
* The app is unit tested with 'Quick and Nimble', and the tested layers are (Presenters, Repositories, and Use cases).

## Libraries

  * 'SwiftLint' and 'SwiftFormat' for keeping the code clean without warning and bad dirty code.
  * 'Alamofire' for networking and I used the cache mechanism in Alamofire to cache my requests.
  * 'Kingfisher' for downloading images and caching it.
  * 'Reusable' for making it super-easy to create, dequeue and instantiate reusable views.
  * 'Quick and Nimble' for unit testing the app.

## Author

Marko Nazmy Armiya.
[email me](mailto:marko.nazmy@gmail.com)

## License

A decade of Movies is available under the MIT license. See the LICENSE file for more info
