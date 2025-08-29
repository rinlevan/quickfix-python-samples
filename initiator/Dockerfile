FROM python:3.10.12-slim AS builder

WORKDIR /src

COPY requirements.txt .

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential gcc libffi-dev \
    && pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

COPY ./initiator .

FROM builder AS runtime
ARG WORKING_DIR=${WORKING_DIR}
WORKDIR ${WORKING_DIR}
RUN apt-get purge -y --auto-remove build-essential gcc libffi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src .
CMD [ "sh", "./start.sh" ]
