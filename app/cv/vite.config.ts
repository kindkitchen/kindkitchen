import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

// https://vite.dev/config/
export default defineConfig({
  base: "/cv",
  build: {
    assetsDir: "cv/assets",
    outDir: "dist/cv",
  },
  plugins: [react()],
});
