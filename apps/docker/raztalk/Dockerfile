FROM alpine/git as downloader
WORKDIR /workspace
RUN git clone https://github.com/razzie/raztalk.git .
RUN git clone --recurse-submodules https://github.com/razzie/raztools.git

FROM mono as builder
WORKDIR /workspace
COPY --from=downloader /workspace .
RUN sed -i '1 i\using System.Threading;' ./raztalk/Program.cs
RUN sed -i 's/127.0.0.1:8888/+:8080/g' ./raztalk/Program.cs
RUN sed -i 's/Console.ReadLine()/Thread.Sleep(Timeout.Infinite)/g' ./raztalk/Program.cs
RUN xbuild /target:raztalk /p:Configuration=Release raztalk.sln

FROM mono
WORKDIR /
COPY --from=builder /workspace/raztalk/bin/Release .
CMD ["mono", "./raztalk.exe"]
