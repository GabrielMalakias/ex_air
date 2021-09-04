# ExAir

To start your Phoenix server:

  * Start DB `docker compose up db -d`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

# Using the API

The Api uses REST and it is idempotent. In order insert new records it uses `Task.Supervisor` to save everything in background

-> List resources (index)
GET localhost:4000
- Headers: application/json

ex:.
curl -H "Accept: application/json" http://localhost:4000


Response: 200
Body:

```json
{
    "data": [
        {
            "actual": 236,
            "forecast": 235,
            "from": "2021-01-20T12:30:00Z",
            "id": 1611145800,
            "index": "moderate",
            "to": "2021-01-20T13:00:00Z"
        },
   ]
}
```

-> Create resources (create)

POST -H "Accept: application/json" http://localhost:4000?from=2021-01-20T12:00:00Z&to=2021-01-20T14:30:00Z

Response: 200 (OK)
Body empty

