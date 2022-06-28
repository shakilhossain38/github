# Github Flutter
<table>
  <tr>
    <td>
      <img src="assets/github.png" height=70 align="left"> 
    <p>A Selling App
      </p>
    </td>
  </tr>
</table>
<table>
  <tr>
     <td>Home Screen</td>
       <td>Dev Flavor Home Screen</td>
        <td>Sorting Options</td>
    <td>Most Stars</td>
     <td>Fewest Stars</td>
     <td>Most Forks</td>
    <td>Recently Updated</td>
     <td>Details</td>
  </tr>
  <tr>
    <td><img src="https://drive.google.com/uc?export=download&id=1l1UNkT6fhzJT9UN7CtYolLb5hV93n531" width=270 ></td>
    <td><img src="https://drive.google.com/uc?export=download&id=1l6FcKd97ZN2WGq-Oyjhr7tI23jc3jfiR" width=270 ></td>
    <td><img src="https://drive.google.com/uc?export=download&id=1lF0oKZ6aG5nIAWNnUZcTY3D_VKNere-A" width=270 ></td>
    <td><img src="https://drive.google.com/uc?export=download&id=1l9GInCGzm0P61O5hlc_VlWR1OVBy5nlz" width=270 ></td>
    <td><img src="https://drive.google.com/uc?export=download&id=1lAj5b5OxLydpb1DixRlGTt5v7FCBHrp-" width=270 ></td>
     <td><img src="https://drive.google.com/uc?export=download&id=1lDrrGfcUJJth_UagJBV721w2UAzauz7V" width=270 ></td>
     <td><img src="https://drive.google.com/uc?export=download&id=1lEdhGLzNnk-RywPMdyC7sedodH2UnWeE" width=270 ></td>
    <td><img src="https://drive.google.com/uc?export=download&id=1lF-CyKM2ZaOYddoptbAhc1IRgq87zwNP" width=270 ></td>
  </tr>
 </table>

## Download APK
<a id="raw-url" href="https://drive.google.com/uc?export=download&id=1lLWTG4QRjgX-x30-fAuzcaBlaQg1pCLR">Production Flavor</a><br />
<a id="raw-url" href="https://drive.google.com/uc?export=download&id=1lKxDHWC_b_QNNGBpF2vgCjM84SxbX0zT">Dev Flavor</a>

## Project Environment
```
=> Flutter (Channel stable, 3.0.2)
=> Android Studio (version 2021.2.1)
=> Dart SDK version: 2.17.3 (stable) 
```


## Feature List
```
├── Home Screen
├── Sorting
├── Selected Sort Items and option persisted
├── Offline Data save and load
├── Repository Details
```


## Extra Feature
```
├── UI Test cases
├── Flavor
```

## Used Package
```
1. provide - for state management
2. bot_toast - for loader and toast message
3. http - for api calling
4. dartz - for handling errors
5. cached_network_image - for network images
6. shared_preferences - for local storage
7. intl - for date format
```

## Set Flavoring
```
For setting flavor, configuration should be set as bellow

1. For Production
  - Select main_prod.dart as entrypoint
  - Build flavor should be prod
  
2. For Dev
  - Select main.dart as entrypoint
  - Build flavor should be dev
  
```

## Run UI Test Cases
```
For running ui tests cases run the below commands on terminal of the project

1. For Production
  - flutter drive --flavor prod --target=test_driver/home.dart

  
2. For Dev
  - flutter drive --flavor dev --target=test_driver/home.dart

  
```

