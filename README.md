# Phonk Forge

A self-contained, offline-friendly web app that builds phonk arrangements from
sounds synthesized at runtime with the Web Audio API. There are no samples,
libraries, fonts, images, CDN requests, build steps, or configuration keys.

## Run

Open `index.html` in a modern browser, or serve the directory with any static
file server:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000/`. Audio starts only after a user gesture, as
required by browsers.

## How it works

1. Pick one of the 16 square pads (or use its keyboard shortcut). Clicking a pad
   also auditions it.
2. Toggle the 16 square steps for the selected sound.
3. Set the tempo by repeatedly pressing that pad or **TAP / RATE**, or by typing
   a BPM into the **TEMPO** field. Taps use the median of the last six press
   intervals (clamped to 80–1200 ms); typed BPM is clamped to 50–750. A 250 ms
   interval is 240 BPM. Either method updates that sound's step length and
   recompiles the arrangement automatically without resetting playback.
4. Press **COMPILE ARRANGEMENT** to merge all active sound patterns into one
   deterministic timeline of `{soundId, time, duration}` events, then use the
   transport bar.

A step's start time is `step × (rateMs / 1000)`, so faster taps place that
sound's events closer together; its note duration is capped at 92% of the step
spacing. Each sound also has its own gain and pan. The master chain feeds a
dynamics compressor before the volume-controlled output.

## Controls

- `Space`: play/pause (outside inputs and focused buttons)
- `←` / `→`: previous/next compiled event
- `↑` / `↓`: seek ±0.5 s
- `Home` / `End`: start/end
- `Esc`: stop
- Number/`Q`–`Y` keys: select and audition pads

Form controls keep their native keyboard behavior.

## Deployment

Deploy the directory as a static site; `index.html` is the only required file.
No server-side process, ports, environment variables, secrets, persistent
storage, or health-check endpoint are needed. Readiness is a successful HTTP
200 for `/index.html` with inline CSS/JS intact. No graceful-shutdown handling
is required because the app has no HTTP service of its own.
