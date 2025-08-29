FROM python:3.10.12-slim AS base

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl build-essential gcc libffi-dev

ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"
RUN uv self update

FROM base AS builder
WORKDIR /src
COPY requirements.txt .
COPY ./initiator .
RUN uv venv \
    && uv pip sync requirements.txt

FROM builder AS runtime
ARG WORKING_DIR=${WORKING_DIR}
WORKDIR ${WORKING_DIR}
RUN apt-get purge -y --auto-remove build-essential gcc libffi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src .
CMD [ "sh", "./start.sh" ]
