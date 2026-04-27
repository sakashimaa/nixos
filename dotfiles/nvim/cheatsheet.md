# Cheatsheet — новые фичи

## Neovim — навигация

| Клавиша | Действие |
|---------|----------|
| `-` | Oil — файловый менеджер (как буфер) |
| `Space o` | Code outline (aerial) — символы/функции справа |
| `Space z` | Zen mode — фокусное редактирование |
| `s` | Flash — прыгнуть к символу |
| `S` | Flash Treesitter — выделить по scope |
| `Space` (подождать) | Which-key — подсказки по всем маппингам |

## Neovim — find (Telescope)

| Клавиша | Действие |
|---------|----------|
| `Space ff` | Найти файл |
| `Space fw` | Найти слово (grep) |
| `Space fo` | Недавние файлы |
| `Space ft` | Найти TODO |
| `Space fp` | Проекты |
| `Space fu` | Undo history (визуальное дерево) |

## Neovim — Git

| Клавиша | Действие |
|---------|----------|
| `Space gg` | LazyGit (float) |
| `Space gd` | Diffview open |
| `Space gc` | Diffview close |
| `Space gh` | File history (git log для файла) |
| `Space gm` | Merge view (3-way: LOCAL/BASE/REMOTE) |

## Neovim — в Diffview merge view

| Клавиша | Действие |
|---------|----------|
| `Space co` | Choose ours (наш вариант) |
| `Space ct` | Choose theirs (их вариант) |
| `Space cb` | Choose base |
| `]x` / `[x` | Следующий / предыдущий конфликт |
| `Ctrl+W j` | Перейти в нижнюю панель (MERGED) для сохранения |

## Neovim — диагностика

| Клавиша | Действие |
|---------|----------|
| `Space xx` | Trouble — все диагностики |
| `Space xd` | Trouble — только текущий буфер |
| `gl` | Показать диагностику под курсором |
| `]t` / `[t` | Следующий / предыдущий TODO |

## Neovim — сессии

| Клавиша | Действие |
|---------|----------|
| `Space sr` | Восстановить сессию (для текущей директории) |
| `Space sl` | Последняя сессия |
| `Space sd` | Остановить отслеживание сессии |

## Neovim — прочее

| Клавиша | Действие |
|---------|----------|
| `Space fm` | Форматировать файл |
| `Space ef` | ESLint fix all |
| `Space ih` | Вкл/выкл inlay hints |
| `Space a` | Harpoon — добавить файл |
| `Ctrl+E` | Harpoon — меню |
| `Ctrl+1-4` | Harpoon — файлы 1-4 |
| `A-1` / `A-2` | Терминалы 1/2 |
| `A-v` | Вертикальный терминал |

## Neovide

| Фича | Что делает |
|------|-----------|
| Прозрачность 0.92 | Окно слегка прозрачное |
| Blur на float окнах | Floating windows с размытием |
| Скрытие мыши | Прячется при печати |
| Block cursor | Везде блочный курсор |

## Fish shell

| Команда | Что делает |
|---------|-----------|
| `nv` | Открыть Neovide в текущей директории |
| `yy` | Yazi с cd при выходе |
| `lg` | LazyGit |
| `gs/ga/gc/gp` | git status/add/commit/push |
| `prd/prb/prs` | pnpm run dev/build/start |
| `dc/dcu/dcd` | docker compose/up/down |
| `von/voff/vst` | sing-box start/stop/status |

## Fish — fzf (после fisher install)

| Клавиша | Действие |
|---------|----------|
| `Ctrl+R` | Fuzzy search по истории команд |
| `Ctrl+Alt+F` | Найти файл |
| `Alt+C` | cd в директорию через fzf |
| `Ctrl+Alt+S` | Git status файлы |
| `Ctrl+Alt+L` | Git log |
