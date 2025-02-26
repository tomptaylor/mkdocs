```mermaid
sequenceDiagram
    Participant Cloud
    actor User as Local System
    actor Server as Web Server

    Cloud->>Server: Geojson
    User->>Server: Request File
    Server-->>User: Deliver File
```
