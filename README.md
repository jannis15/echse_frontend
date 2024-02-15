# echse_frontend
 
Ein Fullstack-Projekt zum Tracken der Zeit diverser Windows-Programme (.exe).

- Frontend: Flutter (Dart)
- Backend: FastAPI (Python)

Das Backend fragt jede Minute über die win32-API die aktuell laufenden Prozessdaten ab und speichert diese in einer SQLite-Datenbank.

Das Frontend kann über die REST-Schnittstelle Programme sortiert nach laufender Dauer abfragen und anzeigen.

![demo](https://github.com/jannis15/echse_frontend/assets/78983365/67dbf41e-4b39-43a5-b8d0-16bc855ceb4b)
