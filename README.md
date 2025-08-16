# QuickFIX Python Samples

**Author:** Rin Le (<rinle.it [a] gmail.com>)  
**Reference:** [QuickFIX Configuration Guide](https://www.quickfixj.org/usermanual/2.3.0/usage/configuration.html)  

---

## 📑 Table of Contents
1. [Requirements](#requirements)
2. [Setup](#setup)
3. [Running the Project](#running-the-project)  
   - [Using Docker](#using-docker)  
   - [Running via Terminal](#running-via-terminal)

---

## Requirements
- Python **3.x**
- [QuickFIX Engine 1.15.1](http://www.quickfixengine.org/)

---

## Setup
Install the required dependencies:
```bash
pip install -r requirements.txt
```

---

## Running the Project

### Using Docker

1. Create a .env file in the same directory as the docker-compose.yml file, for example:
   ```sh
   APP_PORT=3000
   WORKING_DIR=/app
   ```
2. Build and run with Docker Compose:
   ```sh
   docker-compose up --build
   ```

---

### Running via Terminal

⚠️ **Important:** Start the **server** first, then start the **client**.  
This is required for QuickFIX to establish a valid FIX protocol connection.  
Make sure to edit `client.cfg` and `server.cfg` beforehand.

Create Sessions folder for both initiator and acceptor
```bash
rm -fr ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
```

#### 1. Run Server (Acceptor)
```bash
cd ./acceptor
python server.py server.cfg
```

#### 2. Run Client (Initiator)
```bash
cd ./initiator
python client.py client.cfg
```

---

✅ You are now ready to test the FIX connection between the Client and Server.
