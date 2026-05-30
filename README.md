# QuickFIX Python Samples

[![Python Version](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/)
[![Docker Support](https://img.shields.io/badge/docker-supported-blue.svg)](https://www.docker.com/)
[![QuickFIX](https://img.shields.io/badge/QuickFIX-1.15.1-green.svg)](http://www.quickfixengine.org/)

A modern reference project demonstrating how to set up, configure, and run a **QuickFIX** engine connection using Python. This repository includes both an **Acceptor** (Server) and an **Initiator** (Client) session configured to connect and exchange FIX messages.

---

## 📁 Repository Structure

```text
├── acceptor/              # Acceptor (Server) Application
│   ├── Dockerfile         # Optimized Docker configuration for Server
│   ├── server.py          # Entry point for Server
│   ├── server.cfg         # Server configuration
│   ├── application.py     # Server session logic (QuickFIX Application)
│   └── start.sh           # Acceptance startup script
├── initiator/             # Initiator (Client) Application
│   ├── Dockerfile         # Optimized Docker configuration for Client
│   ├── client.py          # Entry point for Client
│   ├── client.cfg         # Client configuration
│   ├── application.py     # Client session logic (QuickFIX Application)
│   └── start.sh           # Initiation startup script
├── docker-compose.yml     # Multi-container orchestration
├── requirements.txt       # Project dependencies
└── README.md              # Documentation
```

---

## 🛠️ Prerequisites

* **Python 3.10** (Recommended)
* **Docker & Docker Compose** (Optional, but highly recommended for containerized setup)
* System C++ compilation tools (only needed if compiling from source on local terminal)

---

## 🚀 Getting Started

Choose one of the following methods to run the project:

### Option A: Using Docker (Recommended)

Docker Compose orchestrates both Acceptor and Initiator containers automatically.

1. **Create Environment Configuration:**
   Create a `.env` file in the root directory:
   ```env
   APP_PORT=3000
   WORKING_DIR=/app
   ```

2. **Start the Services:**
   Run Docker Compose to build and start the containers:
   ```bash
   docker compose up --build
   ```

3. **Interactive Control & Logging:**
   * To view real-time logs:
     ```bash
     docker compose logs -f
     ```
   * To open an interactive shell inside the Initiator container:
     ```bash
     docker exec -it quickfix-python-samples-initiator-1 bash
     ```

---

### Option B: Local Terminal Setup

If you prefer to run the components directly on your machine:

1. **Install Dependencies:**
   Ensure you use virtual environments to install dependencies.
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   ```

   > [!TIP]
   > We use `quickfix-binary` in `requirements.txt` to install precompiled wheels. This skips the long, resource-intensive C++ compilation process!

2. **Prepare Session Storage:**
   Create a folder to store session state files:
   ```bash
   rm -rf ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
   ```

3. **Run the Acceptor (Server) First:**
   Navigate to the acceptor directory and run:
   ```bash
   cd acceptor
   python server.py server.cfg
   ```

4. **Run the Initiator (Client):**
   Open a new terminal session, activate your virtual environment, and run:
   ```bash
   cd initiator
   python client.py client.cfg
   ```

> [!IMPORTANT]
> **Startup Order:** Always start the **Acceptor** server first. The **Initiator** client will continuously attempt to connect once active.

---

## ⚡ Build Optimizations

This repository contains optimization features designed to speed up the developer workflow:

* **Precompiled Binaries:** By utilizing `quickfix-binary` instead of standard `quickfix`, we bypass C++ compilation during dependency sync, reducing installation time from 15 minutes to under 7 seconds.
* **Optimized Docker Cache:** `Dockerfile` layer ordering ensures dependencies are cached. Modifying application code in `./acceptor` or `./initiator` will result in near-instant incremental rebuilds (<1s).
* **Shared Cache:** When building with Docker Compose, the second stage reuses the cached virtual environment from the first stage, reducing fresh build times.

---

## 📖 Configuration & Reference

* **QuickFIX Configuration Guide:** Read the official [QuickFIX Configuration Reference](https://www.quickfixj.org/usermanual/2.3.0/usage/configuration.html) to customize sessions, heartbeats, logs, and transport details.
* **Author:** Rin Le (<rinle[dot]it[at]gmail.com>)
