# webview_javascript

Przesyłanie informacji pomiędzy js i app flutter z komponentem WebView\
(kod flutter-a w katalogu lib)

```html
<header>
  <h3>Testowanie :)!!!!</h3>
</header>
<main>
  <button id="btn">Kliknij</button>
  <main>
    <script>
      const btn = document.getElementById("btn");
      const state = ["first", "second"];
      btn.addEventListener("click", () => {
        if (messageHandler) {
          const index = Math.random().toFixed();
          messageHandler.postMessage(state[index]);
        }
      });
    </script>
  </main>
</main>
```
