# Task Checklist - Lab 2: User Registration and Authentication

## DONE
- [x] Project initialization and folder structure setup

## IN-PROGRESS
- [ ] Backend Implementation (Spring Boot)
- [ ] Web Application Implementation (ReactJS)
- [ ] Documentation Updates
- [ ] README.md Updates
- [ ] Final Testing and Deployment

## TODO

### Backend Development
- [ ] Create Spring Boot project structure
- [ ] Create User entity with JPA/Hibernate
- [ ] Create UserRepository interface
- [ ] Create AuthService with BCrypt password encryption
- [ ] Create UserService for CRUD operations
- [ ] Create AuthController with:
  - [ ] POST /api/auth/register endpoint
  - [ ] POST /api/auth/login endpoint
- [ ] Create UserController with:
  - [ ] GET /api/user/me endpoint (protected)
- [ ] Configure MySQL database connection (application.properties)
- [ ] Implement JWT authentication middleware
- [ ] Create LoginRequest and RegisterRequest DTOs
- [ ] Create LoginResponse and UserDTO DTOs
- [ ] Create GlobalExceptionHandler for error handling
- [ ] Test all backend endpoints

### Web Application Development
- [ ] Create React app with appropriate structure
- [ ] Create Register page component
- [ ] Create Login page component
- [ ] Create Dashboard/Profile page component (protected)
- [ ] Create Logout functionality
- [ ] Create API service/client for backend communication
- [ ] Implement form validation on Register page
- [ ] Implement form validation on Login page
- [ ] Create authentication context/state management
- [ ] Create route guards for protected pages
- [ ] Create navigation component
- [ ] Test all web application features

### Documentation
- [ ] Create/Update ERD (Entity Relationship Diagram)
- [ ] Create/Update UML diagrams
- [ ] Add Register page screenshot to FRS
- [ ] Add Login page screenshot to FRS
- [ ] Add Dashboard/Profile page screenshot to FRS
- [ ] Add Logout feature screenshot to FRS
- [ ] Update FRS PDF in /docs folder

### README Updates
- [ ] Add project description
- [ ] Add technologies used section
- [ ] Add steps to run backend
- [ ] Add steps to run web app
- [ ] Add steps to run mobile app (placeholder)
- [ ] Add list of all API endpoints
- [ ] Verify all content is clear and complete

### Final Submission
- [ ] Commit all code to GitHub repository
- [ ] Verify repository is public
- [ ] Verify repository structure matches requirements
- [ ] Verify all required files are present
- [ ] Create GitHub repository link for submission
- [ ] Submit in MS Teams with:
  - [ ] GitHub repository link
  - [ ] Updated FRS PDF
  - [ ] Updated TASK_CHECKLIST.md

---

## Notes
- Mobile app is NOT required for this submission (placeholder only)
- All passwords must be encrypted with BCrypt
- API endpoints must be protected where specified
- All incomplete features must remain marked as TODO
