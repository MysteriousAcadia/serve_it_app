# ServeIt
## Project Structure

This project uses bloc for state management, http for making requests, shared_preference for storing data.
- <b>blocs:</b> Contains bloc for all the pages and activities of the application.
- <b>components:</b> Contains flutter widgets that are used in list views and across several pages.
- <b>models:</b> Contains classes for various data structures used such as for making requests, receiving response, storing user data etc.
- <b>pages:</b> Contains all the activites(screens/pages) of the application.
- <b>repositories:</b>(Used only to store and access the user data)
- <b>services:</b> Contains the service classes for api, localstorage, payment etc.
- <b>utils:</b> Contains Utilites/helper functions/constants etc.

<h3><b>main.dart:</b></h3>
Initialises all the blocs and binds them to the context of the main app(to prevent duplicates). Uses the auth_bloc to identify the state of the user(logged in,new user, etc). Also creates the instance of localstorage and binds them to the blocs that need it.


## Dependencies
- flutter:  v1.17.4
- adobe_xd: ^1.0.0+1
- apple_sign_in: ^0.1.0
- chopper: ^3.0.3
- chopper_generator: ^3.0.5
- cupertino_icons: ^0.1.3
- device_info: ^0.4.1+4
- dropdown_search: ^0.4.4
- equatable: ^1.2.2
- expandable: ^4.1.4
- fancy_on_boarding: ^1.6.0
- file_picker: ^2.0.6
- firebase_analytics: ^5.0.15
- firebase_auth: ^0.15.2
- firebase_storage: ^3.1.5
- flutter_bloc: ^5.0.1
- flutter_credit_card: ^0.1.3
- flutter_facebook_login: ^2.0.0
- flutter_svg: ^0.17.1
- geolocator: ^6.0.0+4
- get_it: ^1.0.3
- google_sign_in: ^4.0.4
- http: ^0.12.2
- hydrated_bloc: ^5.0.3
- image_cropper: ^1.3.1
- image_picker: ^0.6.7+4
- intl: ^0.16.1
- json_annotation: ^3.0.0
- meta: ^1.1.8
- modal_progress_hud: ^0.1.3
- progress_dialog: ^1.2.4
- search_widget: ^1.0.2
- shared_preferences: ^0.5.7+3
- stripe_payment: ^1.0.8