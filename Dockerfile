FROM ghcr.io/ggml-org/llama.cpp:server

RUN mkdir -p /models && \
    curl -L --fail --retry 3 \
    -o /models/Qwen3-0.6B-Q2_K.gguf \
    https://huggingface.co/Qwen/Qwen3-0.6B-GGUF/resolve/main/Qwen3-0.6B-Q2_K.gguf

EXPOSE 10000

CMD ["-m","/models/Qwen3-0.6B-Q2_K.gguf","--host","0.0.0.0","--port","10000","-c","256","-n","128","--reasoning","off"]
