FROM ghcr.io/ggml-org/llama.cpp:server

WORKDIR /app

# Smaller Q2_K model for a free/low-memory test.
ADD https://huggingface.co/second-state/Qwen3-0.6B-GGUF/resolve/main/Qwen3-0.6B-Q2_K.gguf?download=true /models/Qwen3-0.6B-Q2_K.gguf

EXPOSE 10000

# Render expects the public HTTP server on PORT; Render's default is 10000.
CMD ["-m", "/models/Qwen3-0.6B-Q2_K.gguf", "--host", "0.0.0.0", "--port", "10000", "-c", "256", "-n", "128"]
