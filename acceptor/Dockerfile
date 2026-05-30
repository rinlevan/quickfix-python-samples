FROM python:3.10.12-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl build-essential gcc libffi-dev \
    && rm -rf /var/lib/apt/lists/*

ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

WORKDIR /src
COPY requirements.txt .
RUN uv venv && uv pip sync requirements.txt
COPY ./acceptor .

FROM python:3.10.12-slim AS runtime
ARG WORKING_DIR=/app
WORKDIR ${WORKING_DIR}

COPY --from=builder /src .
CMD [ "sh", "./start.sh" ]
