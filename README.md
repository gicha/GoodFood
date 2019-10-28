# GoodFood
![enter image description here](https://lh3.googleusercontent.com/j-2f8hnoekoNAFnVW3FfNDc5VbKxwa8-4eREF6mNijtGeIUB4GBt4URpBpEG1NEMloaYeTrEt1llxg=s200)

The Good Food app was created at the JunctionXBudapest 2019 hackathon for Tesco. 
Roughly  one third  of the food produced in the world for human consumption every year isn’t being sold. Our app helps charities find free, expiring products that are still safe to eat.

## Features
![enter image description here](https://lh3.googleusercontent.com/kB1Fwe45-lQnZQ6fgpaH_6b6T5ZVKHGbXfy4wrX3Y7t-uGdxOVic63t9S0t7XHnh9WTQp81DzRI2mA=s500 "")

Find Tesco Shops near you

![enter image description here](https://lh3.googleusercontent.com/XX0M44DRumjSRFFUl9lZFeHvekG3Rures7TZOR9VMBBxQIqvJbYwTBqfkEwSUbbehluzb-ttL2taqw=s500 "")

Browse available products

![enter image description here](https://lh3.googleusercontent.com/TKTp-X5dKGUVkDL2n3oVzYIVteUz-ydh9ht6cCNpu7wQ7dus3-oZK8TxR44Jv5mY6j0hUactXMhdyg=s500)

Get route to the Tesco store

![enter image description here](https://lh3.googleusercontent.com/DsQGpDSSnIGGt7FWTSVvE70Acym8MsNivbFdb3kb9xELIphismeSennJ8BehZ35cHRZIk_npXgta5g=s500)

Add products to your Wish List. And we will notify you when the desired product becomes available.

![enter image description here](https://lh3.googleusercontent.com/E2WvHugjwooN-bD7vjDYSTwIurKQL2A0i1KXROW9YcYRCCGuxIOQa9utAQhJ3Gg03TVcYfo8bLWnXg=s500)

When the desired product becomes available in the Tesco store, you can view it in the Order Page

![enter image description here](https://lh3.googleusercontent.com/XtXtQT8qLoUeT9Uka3FiURV722NzH-g22nrm6mz0pwi4OUCucb4U3pJps_3ndswXS5iUzrzO3DEL4w=s500)

Come to the store, show the QR code and pick up the product

## Technologies

 - Flutter
 - Firebase
 - Here Api to build a route
 - Tesco Labs Api

##  Contacts
@gicha1

gicha@itis.team

## Backend
https://github.com/krivosheeverik/stillFresh12



## Instructions

`flutter packages get`

`flutter pub run build_runner build --delete-conflicting-outputs`

`flutter run`

## !!Important note

Since it was added source generation. please run `$ flutter pub run build_runner build --delete-conflicting-outputs` first or `$ flutter pub run build_runner watch --delete-conflicting-outputs` for continuous rebuilding. but be aware it can lock the flutter.

## To generate docs use
`dartdoc`
## Models

https://charafau.github.io/json2builtvalue/

You can generate base model class using this site. Just paste class from generated code on this site to your model class.
Then, remove jsonTo and Json from.
Model need to be look like
```
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'serializers.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  Location._();

  factory Location([updates(LocationBuilder b)]) = _$Location;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;
  
  @nullable
  @BuiltValueField(wireName: 'coordinates')
  LatLng get coordinates;

  static Serializer<Location> get serializer => _$locationSerializer;
}
```

## I18n

- install `vscode-flutter-i18n-json` plugin for VSCode (https://marketplace.visualstudio.com/items?itemName=esskar.vscode-flutter-i18n-json)
- use `Ctrl+Shift+P` for palette
- add new locale if needed
- fill `/i18n/*.json` files with your localization strings
- **regenerate** Flutter files via Palette (`>Flutter I18n JSON: Update`)
- use strings

### Examples:
**Simple string**

`/i18n/en-US.json`
```json
{
    "title": "Itis template"
}
```
`/lib/screen.dart`
```dart
I18n.of(context).title // => Itis template
```

**String with parameter**

`/i18n/en-US.json`
```json
{
    "greetTo": "Hello, {name}"
}
```
`/lib/screen.dart`
```dart
I18n.of(context).greetTo("User name") // => Hello, User name
```

