'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "76f08d47ff9f5715220992f993002504",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "15d54d142da2f2d6f2e90ed1d55121af",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f02d5b6ca2f35fe38722e0d1d03a3514",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2cd6824d8133c34903e73d60c0924b27",
"assets/packages/mixpanel_flutter/assets/mixpanel.js": "48a5241deca6bca875259d2b562d7081",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/onboarding/logo.png": "b5d046b6eab68b5a5307e746a6a9524e",
"assets/assets/images/onboarding/continue_btn.png": "f1c615327e2681aa2846506067d89f08",
"assets/assets/images/onboarding/scan_wrong.png": "c63b4fa6c64f1bf206c82711c7a39c28",
"assets/assets/images/onboarding/get_started_btn.png": "49797dad7606bdc4f76fc7dbc1d8c66a",
"assets/assets/images/onboarding/stats.png": "6da7cf255c409c0dce2ed9616d07613c",
"assets/assets/images/onboarding/scan_success.png": "bc4754595962df269893ae59b8774051",
"assets/assets/images/onboarding/bubbles.png": "e24b8dafd5588f75b608b8a2c27d09bb",
"assets/assets/images/onboarding/users.png": "42c01d02ff03b0a2de2b21fd3ee1747a",
"assets/assets/images/onboarding/profiles/profile1.png": "e9d4f4f2f4fc24793cdfaa45704c45b6",
"assets/assets/images/onboarding/profiles/profile4.png": "aab8aebdca7a0c228dee68db17d4ee61",
"assets/assets/images/onboarding/profiles/profile3.png": "c4dc8a22bba8d7a216be924aa593d1fb",
"assets/assets/images/onboarding/profiles/profile2.png": "bb46c4b08a2dd60f91d9427da8df5bc1",
"assets/assets/images/onboarding/background.png": "05631cb4ffd30499256565fe27c32b70",
"assets/assets/images/onboarding/tools.png": "60d222a709ee71ca0b3b2a7c7c4a1bcd",
"assets/assets/images/onboarding/stars.png": "28964c78d9a4be3ed8a362d20551c63c",
"assets/assets/images/content_generator.png": "0b7e61ceb93e5ff5d3db69f66d2a0962",
"assets/assets/images/ai_detector.png": "8970bc6e6f435f0b5fd3dda1a2ab23b3",
"assets/assets/images/bubbles.png": "e24b8dafd5588f75b608b8a2c27d09bb",
"assets/assets/images/app_splash_android_12.png": "4701cccc09a41087c4381861991d923f",
"assets/assets/images/app_splash.png": "e9f8c77a3cd5fb399dc053ba10c24573",
"assets/assets/images/app_icon.png": "ac98873596d8f0a1922a55fa93b29158",
"assets/assets/images/ai_humanizer.png": "0ec57363ca559febc0459879b2ff4e6a",
"assets/assets/svg/ai_stars.svg": "33e0b9e49e7db1915aeb7723f46c51d0",
"assets/assets/svg/hashtag.svg": "1c37096c8df162dfe72003acdb23324d",
"assets/assets/svg/clock.svg": "142f9d684c12100ad76522bcc3e1556b",
"assets/assets/svg/link.svg": "01808e7c73f69485d05b40b8999319bc",
"assets/assets/svg/arrow_right_opacity.svg": "e9209d93f727ef58ef8ef8f21dc63d66",
"assets/assets/svg/copy_orange.svg": "45234e7811dad4218b5c1e50a7ccd702",
"assets/assets/svg/taj.svg": "c304e14cba7e8feb4ce11a07437110b7",
"assets/assets/svg/sliders.svg": "669ad4ca2da7ade51abc205b51b3ca05",
"assets/assets/svg/settings_orange.svg": "4d979acc5417720097a263647d3caee2",
"assets/assets/svg/globe.svg": "2b76f3cceda232ff1c9c58354870b32c",
"assets/assets/svg/tab_home.svg": "a64b70763a2981dca834bfae59c17c23",
"assets/assets/svg/docs.svg": "46719aac82d679141ca5ea49b86a70fd",
"assets/assets/svg/clear.svg": "d078c7d0eaa59bc0393e1ce315aa5764",
"assets/assets/svg/light.svg": "bdf51e911872559a12de05a44f1137e0",
"assets/assets/svg/home.svg": "02ac1cf75031608305c1d729195f6cfe",
"assets/assets/svg/stats_orange.svg": "2d71000aa8a7a9d7de242ec2f6739234",
"assets/assets/svg/profile.svg": "a3a53c4fc4e1c8667f8a29a9b45a1261",
"assets/assets/svg/ai_magic.svg": "4ea69cdeecc2badd0032f5655bd99cfb",
"assets/AssetManifest.bin.json": "c949868c002522c963f7649ec2ab32bc",
"assets/fonts/MaterialIcons-Regular.otf": "3ecffd54f790aa2620ab8f4aed83298b",
"assets/AssetManifest.bin": "caba4a1e488fc4b38a721defbe0ef059",
"assets/NOTICES": "bc5a801af5942194be86228609d0ae0c",
"assets/AssetManifest.json": "66d06b970c17f31bd4f2662d13fe72b6",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter_bootstrap.js": "a98a1a5fe821187fa88d1c5fa26eb440",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"index.html": "7e195f22bc31dde8cfa32d9f544ad163",
"/": "7e195f22bc31dde8cfa32d9f544ad163",
"main.dart.js": "1063007961ffc3d27caebe35cd36f9b2",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "9295f3d9f71f0a37283939d6d1805822",
"version.json": "c1e7d89834586707a5906db87367de7a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
