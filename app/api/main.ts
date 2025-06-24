import { OpenAPIHono } from "@hono/zod-openapi";
import { Scalar } from "@scalar/hono-api-reference";
import deno_jsonc from "./deno.json" with { type: "json" };
import { serveStatic } from 'hono/deno';

const app = new OpenAPIHono();

app.doc("/doc", {
  openapi: "3.0.0",
  info: {
    version: (deno_jsonc as { version: string }).version,
    title: "TODO: name your project API",
  },
});

app.get(
  "/api",
  Scalar({
    url: "/doc",
  }),
);

app.get("/cv/*", serveStatic({ root: "static/cv" }));
app.get("/*", serveStatic({ root: "static/site" }));

// app.notFound((c) => {
//   return c.redirect("/");
// });

Deno.serve({
  port: 3000,
}, app.fetch);
