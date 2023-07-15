# CLI Tool 🛠

HappyX provides CLI tool for creating, building and serving your projects 🎈

## Getting Started ✨

### Create Project 💡

> Main command is `hpx create`. This command creates project. You can choose project name and project type. 💡

#### Usage 🔌
```bash
hpx create [optional-arguments]
```

#### Flags 🚩

- `-n` or `--name`: project name;
- `-k` or `--kind`: project kind. May be `SPA` or `SSG`;
- `-t` or `--templates`: enable templates. Works only for `SSG`.
- `-u` or `--use-tailwind`: Use Tailwind CSS 3 (only for `SPA`).
- `-p` or `--path-params`: Use path params assignment.


### Build Project 🔨

> You can build single page application project and minimize JS file size 💡

#### Usage 🔌
```bash
hpx build [optional-arguments]
```

#### Flags 🚩

- `-o` or `--opt-size`: optimize output file size


### Serve Project 👨‍🔬

> You can run your single page application in browser with hot code reloading 💡

#### Usage 🔌
```bash
hpx dev [optional-arguments]
```

#### Flags 🚩

- `-h` or `--host`: address where need to serve
- `-p` or `--port`: port where need to serve
- `-r` or `--reload`: enable hot code reloading


### Convert HTML To HappyX 👨‍🔬

> You can convert your HTML file into happyx file💡

#### Usage 🔌
```bash
hpx html2tag INPUT_FILE [optional-arguments]
```

#### Flags 🚩

- `-o` or `--output`: output file

---

This documentation was generated with [`HapDoc`](https://github.com/HapticX/hapdoc)
