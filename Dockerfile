FROM python:3.12-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home runner

USER runner
WORKDIR /home/runner
ENV PATH="/home/runner/venv/bin:${PATH}" \
    REPO_URL="https://github.com/pypa/sampleproject.git"
RUN python -m venv /home/runner/venv

COPY --chmod=755 run-repo.sh /usr/local/bin/run-repo
ENTRYPOINT ["run-repo"]
CMD ["sample"]
