
# Snip

A browser based screenshot app, privacy focused (your data never leaves your browser, there's no backend).

Need a privacy focused, no install screenshot tool ?
Try it ! https://mestachs.github.io/snip/

![screenshot under ubuntu](./doc/gallery.png "screenshot under ubuntu")

## The pitch

  - sometimes there's no app installed for to make screenshots, but often you have access to a browser
  - a lot of screenshot app offer "sharing" or are directly storing the screenshots

How it works : 
  - It's just html and js in your browser, not native app to install.
  - Snip use the screen sharing feature of your browser to take the screenshot (similar to google meet screen sharing)
  - No backend so you are sure the screenshot stays on your device

## Todo

Not sure I'll implement that but would be nice to

- try to auto detect black "padding" in screenshots
- allow user to annotate, resize, pan
- delayed screenshot

## Dev

```
python3 -m http.server
```

go to http://0.0.0.0:8000/


