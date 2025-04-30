# 🛒 Dropshipping Backend API

This is the backend API for a **Dropshipping Application**, designed to power a scalable dropshipping platform. It supports custom product management, integrates with third-party APIs, and uses secure JWT-based authentication.

---

## 🚀 Features

- 🔐 **JWT Authentication** – Signup/Login APIs with secure token-based sessions.
- 📦 **Product Management API** – Create and view products with category filtering.
- 🛍 **Order Management** – Accept and manage customer orders via API.
- 🌐 **Third-party Product Integration** – Load and show external products (via separate services).
- 🧱 **Modular Rails API** – Clean structure with serializers and versioned routing.

---

## 📚 API Endpoints Overview

### 🔐 Authentication

| Endpoint        | Method | Description          |
|-----------------|--------|----------------------|
| `/api/v1/signup` | POST   | Register new user    |
| `/api/v1/login`  | POST   | User login and token |

### 📦 Products

| Endpoint                         | Method | Description                    | Auth |
|----------------------------------|--------|--------------------------------|------|
| `/api/v1/products`              | GET    | List all products              | ✅   |
| `/api/v1/products`              | POST   | Create a new product           | ✅   |
| `/api/v1/products/:id`          | GET    | Show a single product          | ✅   |
| `/api/v1/products/category?category=Fashion` | GET | Filter products by category | ✅   |

### 🛍 Orders

| Endpoint         | Method | Description               |
|------------------|--------|---------------------------|
| `/api/v1/orders` | GET    | List all orders           |
| `/api/v1/orders` | POST   | Create a new order        |

---

## 🛠 Example JSON Requests

### ✅ Signup

```json
POST /api/v1/signup
{
  "user": {
    "name": "Azhar",
    "email": "azhar@example.com",
    "password": "password",
    "password_confirmation": "password"
  }
}


### ✅ Login

POST /api/v1/login
{
  "email": "azhar@example.com",
  "password": "password"
}


### ✅ Create Product

POST /api/v1/products
Authorization: Bearer <JWT_TOKEN>
{
  "product": {
    "name": "Wireless Mouse",
    "description": "A smooth and ergonomic wireless mouse",
    "price": 599,
    "stock": 100,
    "image": "https://example.com/image.jpg",
    "source": "inhouse",
    "category": "Electronics"
  }
}


### ✅ Create Order

POST /api/v1/orders
{
  "order": {
    "product_id": 1,
    "customer_id": 2,
    "status": "placed"
  }
}


### 🚀 Tech Stack

##  Features

- **Ruby on Rails – API backend
- **PostgreSQL – Relational DB
- **JWT – Authentication
- **ActiveModel Serializers – API response formatting services).
- **Docker – DevOps ready


### 🏁 Setup Instructions

**Clone the repository

git clone https://github.com/Azharsheikh12/dropshipping-backend.git
cd dropshipping-backend

**Install dependencies
bundle install

**Setup database
rails db:create db:migrate db:seed

**Run the server
rails s

API base URL: http://localhost:3000/api/v1/


### 🔐 Authorization
Protected endpoints require a JWT token in the request header:
Authorization: Bearer <your_token_here>


### 📄 License
This project is licensed under the MIT License