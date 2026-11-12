# Samasya Setu — Java web application

Samasya Setu connects local residents, Government reviewers and students around civic problems. Citizens report a problem with its category and map coordinates. Reports of the same category within 400 metres of an unresolved issue are grouped together. A Government demo reviewer can add inspection evidence and publish a problem statement; student teams can then submit solution proposals.

## Technology

- **Backend:** Java 17+ with Spring Boot REST APIs.
- **Database:** SQLite, accessed from Java through JDBC. Data is stored in `samasyasetu.db` beside this project.
- **Frontend:** HTML, CSS and JavaScript served by the Java application. Keeping the web frontend lets the existing map and page design remain in place.
- **Build:** A ready-to-run Java `.jar` is included. Maven is available through the included `mvnw.cmd` script only when you want to rebuild the Java source.

This is a Java backend web project. If the course specifically requires a Java-only user interface, ask whether a Java backend with a web frontend satisfies the rubric; a Swing/JavaFX version would be a separate desktop-app redesign.

## Run on Windows

1. Install a **JDK 17 or newer** and make sure `java -version` works in a new terminal.
2. Extract this ZIP to a normal folder.
3. Double-click *http://127.0.0.1:8000`*Start Samasya Setu.bat**. On first run, Maven and required libraries download automatically. A browser opens at ` when the app starts.
4. Keep the server window open while using the website. Press Ctrl+C in that window to stop it.

Do not open an HTML file directly with `file:///`; use the local HTTP address above so browser pages can call the Java API. Map tiles need internet. If you edit the source and the included JAR is unavailable, `mvnw.cmd spring-boot:run` downloads Maven and Java libraries on its first build.

## Demo accounts

Password for each account: `demo1234`

- Citizen: `citizen@samasyasetu.local`
- Student: `student@samasyasetu.local`
- Government: `government@samasyasetu.local`

## Demo flow

1. Sign in as Citizen, report a problem and pin a map location.
2. Open Dashboard to show reports and live SQLite record counts.
3. Sign in as Government. Add inspection evidence, verify an issue and download **Export issue register** as CSV.
4. Sign in as Student and submit a proposal against a verified issue.

## Project structure

- `src/main/java/local/samasyasetu/SamasyaSetuApplication.java` — Java/Spring Boot application entry point.
- `src/main/java/local/samasyasetu/ApiController.java` — REST endpoints, role checks, sessions, clustering and CSV export.
- `src/main/java/local/samasyasetu/DatabaseSetup.java` — SQLite tables, safe additive migration and first-run demo records.
- `src/main/java/local/samasyasetu/PasswordHash.java` — salted PBKDF2 password hashing.
- `src/main/resources/static/` — website pages, JavaScript, CSS and SVG illustrations.
- `src/main/resources/application.properties` — port and SQLite connection settings.
- `pom.xml` — Java dependencies and build configuration.

## What is saved

`samasyasetu.db` contains `users`, `issues`, `reports`, `solutions`, `supports`, `votes` and `notifications`. Dashboard shows live database counts; `http://127.0.0.1:8000/api/health` shows the database path and counts. The Government CSV export includes issue details, coordinates, report count, status, verification evidence and problem statement.

See `DATABASE.md` for a short table-by-table guide and the API route list.

## College-demo scope

The Government account is a demonstration role, not real government authentication. Sessions live in memory and end when the server stops. Reports are grouped by category and distance; the prototype does not use AI to decide whether two descriptions mean the same thing. Do not enter sensitive personal information.