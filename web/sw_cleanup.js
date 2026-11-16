// Replaces Flutter's old service worker for visitors who still have it.
// It deletes every cached copy of the site, unregisters itself and reloads
// open tabs so they fetch the latest deploy. Copied over
// build/web/flutter_service_worker.js by the Firebase predeploy hook.
self.addEventListener('install', () => self.skipWaiting());

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      const keys = await caches.keys();
      await Promise.all(keys.map((key) => caches.delete(key)));
      await self.registration.unregister();
      const clients = await self.clients.matchAll({ type: 'window' });
      clients.forEach((client) => client.navigate(client.url));
    })(),
  );
});
