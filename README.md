###About this project
This app was made for the technical assessment stage of a job interview. I've included the brief for the task below.

### Objective

Your assignment is to create an app showcasing and notifying visitors about
the next SpaceX rocket launch, and displaying details about next launches.
Use Dart and Flutter.

### Brief

You're the last app developer on earth. Everyone is leaving and going to Mars,
to live a safer, cooler life there. The one problem is, people need to know when the next launch
is happening, and that's where you come in the picture. You need to build an app that informs
the public about the next launch, and give them information about future launches.
Everyone is counting on you, go create that app.

### Tasks

- Build out the project to the designs inside the `/Designs` folder
- Connect your application to the **SpaceX-API** (Docs `https://github.com/r-spacex/SpaceX-API/tree/master/docs#rspacex-api-docs`)
- Use the API to build two screens/sections like in the design
- The countdown should be live and specify days, hours, minutes and seconds
- The 'Upcoming Launches' screen/section should display the mission name and date, like in the design
- The countdown and upcoming launches table can be implemented either in separate screens (implement navigation), make them intuitive and fluid
- Add a share buttons for social media platforms, to share the next launch with friends
- Fetching should be done safely, with a fallback when an error occurs
- Each launch should have a 'Bookmark' or 'Favourite' button, that adds it to a separate 'Favourites'
  table/screen. Implement using local storage (either save the launches data or its id for
  later fetching)

### API Endpoints

- Next Launch Counter: 'https://api.spacexdata.com/v4/launches/next'
- Upcoming Launches: 'https://api.spacexdata.com/v4/launches/upcoming'

With these endpoints, a simple GET request will provide you all the data needed for the tasks, no authentication required.
