SOHEL PATHAN, sohelpathan6411@gmail.com  


NOTE: I have used below 2 conditions for 4 api calls  


    String url; 
    if (subBreed == '') {
        //Random image by breed
        url = "/breed/$breed/images/random";
    } else {
        //Random image by breed and sub breed
        url = "/breed/$breed/$subBreed/images/random";
    }
    
    String url; 
    if (subBreed == '') {
        //Images list by breed
        url = "/breed/$breed/images";
    } else {
        //Images list by breed and sub breed
        url = "/breed/$breed/$subBreed/images";
    }


------------------------------------------------------------
**Tech Stack:**  

Flutter 3.10.5 • channel stable • https://github.com/flutter/flutter.git  

Tools • Dart 3.0.5 • DevTools 2.23.1    

------------------------------------------------------------

**Git Repository:**   

https://github.com/sohelpathan6411/dogs_finder.git  


------------------------------------------------------------

**Requirements:**  


Android Studio  

VS Code  

Emulator/Simulator  


------------------------------------------------------------

**Commands to run the app:**  


flutter clean  

flutter pub get  

flutter run  


Create apk   

flutter build apk  


------------------------------------------------------------


**Highlight feature and Modules in App Folder:**  


Splash screen -  Fetching all breeds (response includes subreeds too, so no other sub breed api call required)  

Dashboard - 1. Intially default selected "breed", which is has subreeds (in our case autralian has subbreed)  
             Note: Sub breed is not selected intially  
             
            2. Fetching Random image & Images list by "breed"  

            3. Once user select "sub breed" from top section , Fetching Random image & Images list by "breed" & "sub breed"  

            4. breed list is long, so added search dialog for breeds  

            5. Pull to refresh is there  

            6. Local pagination is implimented because we are getting images list at once, it may be long.   
            Pagination helps to load images properly and gardullay as user scrolls down.  

               Logic: just increamenting itemCount for gridview, whenever user scrolls down itemCount increases and reaches to the end with Text message at the bottom.  

            7. Breeds count, images count shown  


          
Fullimage -  Full Screen view along with Dismiss on close icon clicked or sliding image down.  

Additionals - No internet snackbars, no internet message on dashbaord, cacheimage widgets, loading gif, Hero animations.  

            
 
------------------------------------------------------------

**libs Used:**  

  cupertino_icons:   

  get: //state management  

  dartz:  //Either wrapper api calls  

  dio:  // Http client for rest apis calls  
  
  internet_connection_checker: // Data connection validator on request calls  

  shimmer: // Placeholder views  

  cached_network_image: //avoid reloading of images by cache  

  flutter_screenutil: // to manage dynamic font size based on screen size  

  
------------------------------------------------------------  

**Project structure:**  


```
assets
   |-- fonts
   |   |-- helvetica
   |   |   |-- HelveticaNeueMedium.ttf
   |-- gifs
   |   |-- loading.gif
lib
   |-- app
   |   |-- data
   |   |   |-- model
   |   |   |   |-- breed_model.dart
   |   |   |   |-- imges_list_model.dart
   |   |   |   |-- random_image_model.dart
   |   |-- modules
   |   |   |-- dashboard
   |   |   |   |-- bindings
   |   |   |   |   |-- dashboard_binding.dart
   |   |   |   |-- controllers
   |   |   |   |   |-- dashboard_controller.dart
   |   |   |   |-- views
   |   |   |   |   |-- breed
   |   |   |   |   |   |-- breed_list_view.dart
   |   |   |   |   |   |-- sub_breed_list_view.dart
   |   |   |   |   |-- dashboard_view.dart
   |   |   |   |   |-- images_list_view.dart
   |   |   |   |   |-- random_image_view.dart
   |   |   |-- fullimage
   |   |   |   |-- bindings
   |   |   |   |   |-- fullimage_binding.dart
   |   |   |   |-- controllers
   |   |   |   |   |-- fullimage_controller.dart
   |   |   |   |-- views
   |   |   |   |   |-- fullimage_view.dart
   |   |   |-- splash
   |   |   |   |-- bindings
   |   |   |   |   |-- splash_binding.dart
   |   |   |   |-- controllers
   |   |   |   |   |-- splash_controller.dart
   |   |   |   |-- services
   |   |   |   |   |-- dogs_repo.dart
   |   |   |   |   |-- dogs_repo_impl.dart
   |   |   |   |-- views
   |   |   |   |   |-- splash_view.dart
   |   |-- routes
   |   |   |-- app_pages.dart
   |   |   |-- app_routes.dart
   |-- core
   |   |-- base
   |   |   |-- base_controller.dart
   |   |   |-- dio_client.dart
   |   |-- consts
   |   |   |-- api_consts.dart
   |   |   |-- app_consts.dart
   |   |   |-- color_consts.dart
   |   |   |-- img_const.dart
   |   |-- network
   |   |   |-- network_check_service.dart
   |   |-- themes
   |   |   |-- text_styles.dart
   |   |-- utils
   |   |   |-- utility.dart
   |   |   |-- widget_utils
   |   |   |   |-- asset_image_view.dart
   |   |   |   |-- cache_image_view.dart
   |   |   |   |-- custom_snack_bars.dart
   |   |   |   |-- search_selection_dialog_view.dart
   |   |   |   |-- shimmers.dart
   |-- localisation
   |   |-- lang_jsons
   |   |   |-- eng_lang.dart
   |   |-- languages.dart
   |-- main.dart
```
  
------------------------------------------------------------  

**Views:**
:-------------------------:|:-------------------------:
![Simulator Screen Shot - iPhone 13 Pro Max - 2023-10-27 at 23 34 44](https://github.com/sohelpathan6411/dogs_finder/assets/36534117/5671d811-8d8c-4011-b5e4-1f1c85c0e427)
|
![Simulator Screen Shot - iPhone 13 Pro Max - 2023-10-27 at 23 35 06](https://github.com/sohelpathan6411/dogs_finder/assets/36534117/1d7de4e8-e078-4c8c-87eb-45e8167e4dbb)

:-------------------------:|:-------------------------:
![Simulator Screen Shot - iPhone 13 Pro Max - 2023-10-27 at 23 35 18](https://github.com/sohelpathan6411/dogs_finder/assets/36534117/6fac4404-feb0-47a0-a819-0c4df6d76380)
|
![Simulator Screen Shot - iPhone 13 Pro Max - 2023-10-27 at 23 35 32](https://github.com/sohelpathan6411/dogs_finder/assets/36534117/80a0b8f6-aafb-4e85-9b82-020c7451a923)
:-------------------------:
![Simulator Screen Shot - iPhone 13 Pro Max - 2023-10-27 at 23 39 25](https://github.com/sohelpathan6411/dogs_finder/assets/36534117/db54c94f-efa7-412e-a79f-a69c530aeb95)











