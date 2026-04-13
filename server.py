from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
from pathlib import Path
import json
from urllib.parse import urlparse
from datetime import datetime, timezone

BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data"
LEADS_FILE = DATA_DIR / "leads.json"

DATA_DIR.mkdir(exist_ok=True)
if not LEADS_FILE.exists():
    LEADS_FILE.write_text("[]", encoding="utf-8")


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(BASE_DIR), **kwargs)

    def _send_json(self, status_code: int, payload: dict):
        body = json.dumps(payload, ensure_ascii=False).encode("utf-8")
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_POST(self):
        parsed = urlparse(self.path)
        if parsed.path != "/api/lead":
            return self._send_json(404, {"ok": False, "error": "Not found"})

        try:
            length = int(self.headers.get("Content-Length", "0"))
            raw = self.rfile.read(length)
            payload = json.loads(raw.decode("utf-8"))
        except Exception:
            return self._send_json(400, {"ok": False, "error": "Invalid JSON"})

        record = {
            "id": datetime.now(timezone.utc).strftime("lead-%Y%m%d-%H%M%S-%f"),
            "receivedAt": datetime.now(timezone.utc).isoformat(),
            "contactName": payload.get("contactName", ""),
            "companyName": payload.get("companyName", ""),
            "email": payload.get("email", ""),
            "preferredContact": payload.get("preferredContact", ""),
            "businessType": payload.get("businessType", ""),
            "primaryNeed": payload.get("primaryNeed", ""),
            "currentProblem": payload.get("currentProblem", ""),
            "desiredOutcomes": payload.get("desiredOutcomes", ""),
            "additionalNotes": payload.get("additionalNotes", ""),
            "estimatedBudget": payload.get("estimatedBudget", ""),
            "language": payload.get("language", "th"),
            "source": payload.get("source", "website"),
            "status": "new"
        }

        try:
            existing = json.loads(LEADS_FILE.read_text(encoding="utf-8"))
            if not isinstance(existing, list):
                existing = []
        except Exception:
            existing = []

        existing.append(record)
        LEADS_FILE.write_text(json.dumps(existing, ensure_ascii=False, indent=2), encoding="utf-8")
        return self._send_json(200, {"ok": True, "leadId": record["id"]})


if __name__ == "__main__":
    server = ThreadingHTTPServer(("0.0.0.0", 8931), Handler)
    print("KORP site server running at http://0.0.0.0:8931")
    server.serve_forever()
