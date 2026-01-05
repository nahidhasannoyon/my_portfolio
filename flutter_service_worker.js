'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "26ad3bf42edd0a7ae61b120f0ef1d9e1",
"icons/Icon-192.png": "390777651018b2b939144a3af383d842",
"icons/apple-touch-icon.png": "6c729bd435075ea0334fc2d1ae58ee3f",
"icons/icon-512-maskable.png": "785e33de46d313fdb7ad9caaab5e23b3",
"icons/favicon.ico": "48f797ad24ff6b6d0a2bdb3b9643bafe",
"icons/icon-192-maskable.png": "59b4bc7bc2610ebf82624abe655a0203",
"manifest.json": "2663fc0801d7af4db5de7c61d72f6f90",
"index.html": "efecfa2f9a6764a6f6bc26c1d36c5c52",
"/": "efecfa2f9a6764a6f6bc26c1d36c5c52",
"tom_jerry_cursor.js": "7346a1bf0fb31b5f3364163444c10c9d",
"cursor_styles.css": "4e952986caa9039061e0eb7774ca2cc5",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "929320c916a25da31ee3751f441e01fb",
"assets/assets/icons/linkedIn.svg": "69e3d549ea914961460f7b1cc4107208",
"assets/assets/icons/ui_ux.png": "48491cc6821f72f919758e807abeecac",
"assets/assets/icons/github.svg": "2754352a02892fd8aa7f67e579636fcc",
"assets/assets/icons/rest_api.png": "38a1476d8eded6b6118248fd2eebc9bc",
"assets/assets/icons/app_optimization.png": "6ce855e1e79a9dd2edc9cbae42fe7cb3",
"assets/assets/icons/whatsapp.svg": "5ac4c30574db23a47918db2bf85f8f45",
"assets/assets/icons/pub-dev-logo.svg": "7537e5a9c87e18ea18467636957e6e19",
"assets/assets/images/nahid_hasan_noyon.jpeg": "9b4e0ed6aab700c3c71701e4e33a2cb8",
"assets/assets/images/for_mouse_cursor/jerry.png": "03c4202c17c3235d7a1836de2206c95f",
"assets/assets/images/for_mouse_cursor/tom-and-jerry-fighting-1.png": "503bd6cf34ac528da599103535392a30",
"assets/assets/images/for_mouse_cursor/jerry-on-toms-head.png": "9514921795e8b967e58e1f2baf026ea9",
"assets/assets/images/for_mouse_cursor/tom-and-jerry-fighting-2.png": "5d2716e9f7b5acc298b78bdb29702e59",
"assets/assets/images/for_mouse_cursor/tom-head.png": "02eab126a0dd5fb99cb0ffe12ce6788e",
"assets/assets/images/certificates/Courses/Flutter/Flutter%2520-%2520Firebase%2520-%2520MySQL%2520Multi-store%2520App%2520(Full%2520-%2520Deep).jpg": "2464a0defde99651136fc0cffdd577b0",
"assets/assets/images/certificates/Courses/Flutter/Flutter%2520&%2520Dart%2520-%2520The%2520Complete%2520Flutter%2520App%2520Development%2520Course.jpg": "5cf4bbb60bf36dec71ef330011b924ab",
"assets/assets/images/certificates/Courses/Flutter/The%2520Complete%2520Flutter%2520Development%2520Bootcamp%2520with%2520Dart.jpg": "ac6472b5016d03a3fc591963cf5c5b0e",
"assets/assets/images/certificates/Courses/Flutter/Dart%2520and%2520Flutter%2520-%2520The%2520Complete%2520Developer's%2520Guide.jpg": "de5e425faaac6934e2e8f0d0fb5caa55",
"assets/assets/images/certificates/Courses/Flutter/Learn%2520Flutter%2520GetX%2520Course%25202023.jpg": "4d4b1b008886f9681cbbb46684692948",
"assets/assets/images/certificates/Courses/Flutter/GetX%2520Flutter%2520App%2520Development.jpg": "927b2f3928f85ca5a6660c5a56688b5b",
"assets/assets/images/certificates/Courses/ChatGPT/Mastering%2520the%2520Fundamentals%2520of%2520ChatGPT%2520and%2520AI%2520Tools.jpg": "7f873d3d362195d21e45492fe32395fb",
"assets/assets/images/certificates/Courses/ChatGPT/ChatGPT%2520Plugins%2520-%2520The%2520Complete%2520Guide.jpg": "895136e33fed3992a288b3531a1019ce",
"assets/assets/images/certificates/Courses/Git/The%2520Git%2520and%2520Github%2520Bootcamp.jpg": "4d5d3ab122141ec6e4b32f2d1264379a",
"assets/assets/images/certificates/Courses/Git/Introduction%2520to%2520Git%2520and%2520GitHub%2520Certificate.jpg": "8cdf50b4712533a1687bee213892dcb6",
"assets/assets/images/certificates/Courses/Git/Git%2520Going%2520Fast%2520One%2520Hour%2520Git%2520Crash%2520Course%2520Certificate.jpg": "46cda715a1406007502d21bf47b68cd5",
"assets/assets/images/udemy.png": "1cb9157585d5e929e3c1fc150147bac6",
"assets/assets/images/google.png": "0778e348e98c549f3b6467a2d0a60117",
"assets/assets/images/mind_luster.png": "d97897d32ab299dc3e3a5df5f49debdb",
"assets/assets/images/gifs/wakatime-weekdays.gif": "b6b33a1c75dd37dbc936777d9f6c3b24",
"assets/assets/images/gifs/flutter-logo-loading.gif": "97a930d680d293b049ea1ef30224bf93",
"assets/assets/images/gifs/wakatime-frequency-of-days.gif": "f035dc3a3469d4eba86d5239bd8185be",
"assets/assets/jsons/flutter-work.json": "9ecbd8717e971619d8c8b6bafbe90112",
"assets/fonts/MaterialIcons-Regular.otf": "107398792b399c62ac36d5ccbd515ec3",
"assets/NOTICES": "3eeaff2924df64a93a15ef59c6a07e46",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "aedc1ceb1b539eb3a5b9c6f4020638ed",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"flutter_bootstrap.js": "06c6d24b7a6f9539f5db841d326d09ae",
"version.json": "f28137bf46763fe8489b8e800c114ab5",
"main.dart.js": "596348f31b14e85670510a03872862af"};
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
