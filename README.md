# QuickFIX Python Samples

**Author:** Rin Le (<rinle.it [a] gmail.com>)  
**Reference:** [QuickFIX Configuration Guide](https://www.quickfixj.org/usermanual/2.3.0/usage/configuration.html)  

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

## Start the project

<details>
<summary>Using Docker</summary>
1; Create a .env file in the same directory as the docker-compose.yml file, for example:

   ```sh
   APP_PORT=3000
   WORKING_DIR=/app
   ```

2; Build and run with Docker Compose:

   ```sh
   docker-compose up --build
   ```

3; If you want to provide input directly from the keyboard (interactive mode), use docker exec to open a shell inside the running container. For example:

   ```bash
   docker exec -it <container_name> bash
   ```

   Replace <container_name> with the actual name or ID of your running container.

</details>

<details>
<summary>On Terminal</summary>

⚠️ **Important:** Start the **acceptor** first, then start the **initiator**.  

Make sure to configure both `client.cfg` and `server.cfg` beforehand.

Create Sessions folder for both initiator and acceptor

```bash
rm -fr ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
```

1; Start Server (Acceptor)

```bash
cd ./acceptor
python server.py server.cfg
```

2; Start Client (Initiator)

```bash
cd ./initiator
python client.py client.cfg
```

</details>
---

✅ You are now ready to test the FIX connection between the Client and Server.
