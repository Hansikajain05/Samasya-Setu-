# Samasya Setu database and backend (Java)

The Java Spring Boot server is in `src/main/java/local/samasyasetu/`. `ApiController.java` receives browser requests; `DatabaseSetup.java` creates or migrates SQLite tables. The database file is `samasyasetu.db` in the project folder.

| Table | Saved information |
|---|---|
| `users` | Name, email, role, random salt and password hash |
| `issues` | Grouped issue details, map coordinates, report count, status and verification statement |
| `reports` | Each citizen submission, linked issue and optional photo |
| `solutions` | Student team proposals |
| `supports` | Users supporting an issue |
| `votes` | Ratings and feedback on proposals |
| `notifications` | Status updates sent to issue reporters |

Passwords are hashed with PBKDF2; the original password is not stored. New reports group under an unresolved issue when category matches and coordinates are within 400 metres. Government verification requires an evidence note and records the reviewer and timestamp. This Government account is only for a college demonstration.

## Where to show saved data

- Dashboard: live counts for users, reports, issues and solutions.
- `http://127.0.0.1:8000/api/health`: backend status, database path and table counts in JSON.
- Government portal: **Export issue register** downloads an Excel-readable CSV. The route requires a Government login.
- `samasyasetu.db`: open with DB Browser for SQLite to inspect table rows directly.

## API routes

- GET `/api/health`, `/api/me`, `/api/me/reports`, `/api/issues`, `/api/solutions`, `/api/stats`, `/api/notifications`
- POST `/api/register`, `/api/login`, `/api/logout`
- POST `/api/issues`, `/api/issues/{id}/support`, `/api/issues/{id}/status`
- POST `/api/solutions`, `/api/solutions/{id}/vote`
- GET `/api/export/issues.csv` (Government role required)