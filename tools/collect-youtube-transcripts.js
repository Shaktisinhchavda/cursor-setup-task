const fs = require("fs");
const path = require("path");
const { YoutubeTranscript } = require("youtube-transcript");

const targetsPath = path.join("research", "youtube-transcripts", "transcript-targets.md");
const outputDir = path.join("research", "youtube-transcripts", "collected");
const logPath = path.join("research", "other", "youtube-transcript-api-results.csv");

function csvCell(value) {
  return `"${String(value ?? "").replaceAll('"', '""')}"`;
}

function slug(value) {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 80);
}

function parseTargets(markdown) {
  return markdown
    .split(/\r?\n/)
    .filter((line) => line.includes("https://www.youtube.com/"))
    .map((line) => {
      const columns = line.split("|").map((column) => column.trim());
      const urlMatch = line.match(/https:\/\/www\.youtube\.com\/(?:watch\?v=|shorts\/)([A-Za-z0-9_-]{11})/);

      if (columns.length < 6 || !urlMatch) {
        return null;
      }

      return {
        source: columns[2],
        title: columns[3],
        url: urlMatch[0],
        videoId: urlMatch[1],
        published: columns[5],
      };
    })
    .filter(Boolean);
}

async function main() {
  if (!fs.existsSync(targetsPath)) {
    throw new Error(`Targets file not found: ${targetsPath}`);
  }

  fs.mkdirSync(outputDir, { recursive: true });
  fs.mkdirSync(path.dirname(logPath), { recursive: true });

  const targets = parseTargets(fs.readFileSync(targetsPath, "utf8"));
  const rows = [
    ["Source", "Video", "VideoId", "Url", "Status", "Segments", "OutputFile", "CollectedAt"],
  ];

  for (const target of targets) {
    const collectedAt = new Date().toISOString().slice(0, 10);

    try {
      const transcript = await YoutubeTranscript.fetchTranscript(target.url);
      const text = transcript.map((item) => item.text).join(" ");
      const outputFile = path.join(outputDir, `${slug(target.source)}-${target.videoId}.md`);

      fs.writeFileSync(
        outputFile,
        [
          "# YouTube Transcript",
          "",
          `- Source: ${target.source}`,
          `- Video: ${target.title}`,
          `- URL: ${target.url}`,
          `- Video ID: ${target.videoId}`,
          `- Published: ${target.published}`,
          `- Collected date: ${collectedAt}`,
          `- Collection method: youtube-transcript npm package`,
          "",
          "## Transcript",
          "",
          text,
          "",
        ].join("\n"),
      );

      rows.push([
        target.source,
        target.title,
        target.videoId,
        target.url,
        "success",
        transcript.length,
        outputFile,
        collectedAt,
      ]);
    } catch (error) {
      rows.push([
        target.source,
        target.title,
        target.videoId,
        target.url,
        error.name || "Error",
        0,
        "",
        collectedAt,
      ]);
    }
  }

  fs.writeFileSync(logPath, rows.map((row) => row.map(csvCell).join(",")).join("\n") + "\n");
  console.log(`Wrote ${logPath}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
