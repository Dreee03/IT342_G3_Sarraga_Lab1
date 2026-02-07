Lab 2 - User Registration and Authentication (Backend + Web)

Project structure
- /web  - React web app
- /backend - Spring Boot backend
- /mobile - (empty for now)
- /docs - documentation

Backend
- Java 17, Spring Boot 3.1.5
- Endpoints:
  - POST /api/auth/register
  - POST /api/auth/login
  - GET /api/user/me (protected)

Run backend (from repo root):
```bash
cd backend
mvn -DskipTests spring-boot:run
```

Web app
- React (start with `npm install` then `npm start` inside /web)

Database (XAMPP phpMyAdmin)
1. Ensure XAMPP MySQL is running.
2. Import `backend/db/init-auth-db.sql` in phpMyAdmin.
3. application.properties already configured to use root with no password.
# IT342_G5_Sarraga_Lab1