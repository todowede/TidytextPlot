# TidytextPlot

R package to transform a dataframe into tidy data structure and plot a graph of change in proportion of given word(s) over time, where time is indicated by turn. 


## Installation

Clone this repository and extract into your computer maintaining the same file structure.  
```https://github.com/todowede/TidytextPlot````

Open TidytextPlot.Rproj in Rustudio.

Then ```devtools``` is needed to load your package using the code:
```
library(devtools)
load_all()
install()
```

Next, copy your `.env.example` file as `.env` and configure your GitHub username.

```
GITHUB_PROFILE=your-github-username
```

## Modifying your profile

You can modify your personal profile, by editing the `resources/views/profile.blade.php` file.

visit the application URL. This will render your markdown file in the browser.

## Pushing your profile to GitHub

This repository already has set up a scheduled command that updates your profile every 5 minutes (if there are changes, for example due to the currently played song on Spotify).

Please refer to the [Laravel documentation](https://laravel.com/docs/7.x/scheduling) to learn more about scheduled tasks.

To manually push your profile, you can run `php artisan github-now:update`. 

## Updating Spotify songs

In order to automatically update the song that is currently playing on Spotify, you need to provide a Spotify developer app client-id and secret.

Sign up at https://developer.spotify.com/dashboard and register your application to obtain these.

Next, add them to your `.env` file:

```
SPOTIFY_CLIENT_ID=your-spotify-client-id
SPOTIFY_SECRET=your-spotify-client-secret
```

Once you have setup your application please go to the [spotify dashboard](https://developer.spotify.com/dashboard/applications), select your application and click "EDIT SETTINGS" in the top right. You will then need to add the following urls based on your environments to the "Redirect URIs" 
section and then hit save. This will allow you to authenticate and store your access token:

Redirect URI example:
```bash
https://yourdomain.com/spotify/callback
```

To get your own personal access token, visit the following URL in your browser: `/spotify/authorize`.

## Linking your own Google Calendar

Please follow the installation steps of the [Laravel Google Calendar](https://github.com/spatie/laravel-google-calendar#installation) package to link your calendar.
By default all calendar event names will be redacted. To show the real event names, modify your `profile.blade.php` file and set `:redact-name` to false.
