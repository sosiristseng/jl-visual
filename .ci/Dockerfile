FROM ghcr.io/sosiristseng/docker-juliabook:1.7.3.11

ENV LC_ALL C.UTF-8

WORKDIR /usr/src/

# FFMPEG
RUN apt-get update && apt-get install -y ffmpeg --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Python deps (matplotlib)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Build Julia environment
COPY Project.toml Manifest.toml ./
# COPY src/ src
RUN julia --threads=auto --color=yes --project=@. -e 'import Pkg; Pkg.instantiate()'

CMD ["jupyter-book"]
