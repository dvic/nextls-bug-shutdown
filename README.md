# Reproduction steps

1. inside the repo run `hx -v`
2. `SPACE+f` and open `foo/mix.exs`  
3. wait a bit and run `:log-open` and reload and go the the bottom using `:rl`, `ge`
4. foo should be loaded just fine
5. now do the same for `bar/mix.exs`, the runtime should crash and restart several times

## Example output log
```
2023-11-14T15:04:32.419 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"initialize","params":{"capabilities":{"general":{"positionEncodings":["utf-8","utf-32","utf-16"]},"textDocument":{"codeAction":{"codeActionLiteralSupport":{"codeActionKind":{"valueSet":["","quickfix","refactor","refactor.extract","refactor.inline","refactor.rewrite","source","source.organizeImports"]}},"dataSupport":true,"disabledSupport":true,"isPreferredSupport":true,"resolveSupport":{"properties":["edit","command"]}},"completion":{"completionItem":{"deprecatedSupport":true,"insertReplaceSupport":true,"resolveSupport":{"properties":["documentation","detail","additionalTextEdits"]},"snippetSupport":true,"tagSupport":{"valueSet":[1]}},"completionItemKind":{}},"hover":{"contentFormat":["markdown"]},"inlayHint":{"dynamicRegistration":false},"publishDiagnostics":{"versionSupport":true},"rename":{"dynamicRegistration":false,"honorsChangeAnnotations":false,"prepareSupport":true},"signatureHelp":{"signatureInformation":{"activeParameterSupport":true,"documentationFormat":["markdown"],"parameterInformation":{"labelOffsetSupport":true}}}},"window":{"workDoneProgress":true},"workspace":{"applyEdit":true,"configuration":true,"didChangeConfiguration":{"dynamicRegistration":false},"didChangeWatchedFiles":{"dynamicRegistration":true,"relativePatternSupport":false},"executeCommand":{"dynamicRegistration":false},"inlayHint":{"refreshSupport":false},"symbol":{"dynamicRegistration":false},"workspaceEdit":{"documentChanges":true,"failureHandling":"abort","normalizesLineEndings":false,"resourceOperations":["create","rename","delete"]},"workspaceFolders":true}},"clientInfo":{"name":"helix","version":"23.10 (f6021dd0)"},"initializationOptions":{"experimental":{"completions":{"enable":true}}},"processId":8692,"rootPath":"/Users/dvic/Development/temp/nextls-bug/foo","rootUri":"file:///Users/dvic/Development/temp/nextls-bug/foo","workspaceFolders":[{"name":"foo","uri":"file:///Users/dvic/Development/temp/nextls-bug/foo"}]},"id":0}
2023-11-14T15:04:32.725 helix_lsp::transport [INFO] nextls <- {"id":0,"jsonrpc":"2.0","result":{"capabilities":{"completionProvider":{"triggerCharacters":[".","@","&","%","^",":","!","-","~","/","{"]},"definitionProvider":true,"documentFormattingProvider":true,"documentSymbolProvider":true,"experimental":null,"hoverProvider":true,"referencesProvider":true,"textDocumentSync":{"change":1,"openClose":true,"save":{"includeText":true}},"workspace":{"workspaceFolders":{"changeNotifications":true,"supported":true}},"workspaceSymbolProvider":true},"serverInfo":{"name":"Next LS"}}}
2023-11-14T15:04:32.725 helix_lsp::transport [INFO] nextls <- {"capabilities":{"completionProvider":{"triggerCharacters":[".","@","&","%","^",":","!","-","~","/","{"]},"definitionProvider":true,"documentFormattingProvider":true,"documentSymbolProvider":true,"experimental":null,"hoverProvider":true,"referencesProvider":true,"textDocumentSync":{"change":1,"openClose":true,"save":{"includeText":true}},"workspace":{"workspaceFolders":{"changeNotifications":true,"supported":true}},"workspaceSymbolProvider":true},"serverInfo":{"name":"Next LS"}}
2023-11-14T15:04:32.725 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"initialized","params":{}}
2023-11-14T15:04:32.726 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"workspace/didChangeConfiguration","params":{"settings":{"experimental":{"completions":{"enable":true}}}}}
2023-11-14T15:04:32.726 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"languageId":"elixir","text":"defmodule Foo.MixProject do\n  use Mix.Project\n\n  def project do\n    [\n      app: :foo,\n      version: \"0.1.0\",\n      elixir: \"~> 1.15\",\n      start_permanent: Mix.env() == :prod,\n      deps: deps()\n    ]\n  end\n\n  # Run \"mix help compile.app\" to learn about applications.\n  def application do\n    [\n      extra_applications: [:logger]\n    ]\n  end\n\n  # Run \"mix help deps\" to learn about dependencies.\n  defp deps do\n    [\n      # {:dep_from_hexpm, \"~> 0.3.0\"},\n      # {:dep_from_git, git: \"https://github.com/elixir-lang/my_dep.git\", tag: \"0.1.0\"}\n    ]\n  end\nend\n","uri":"file:///Users/dvic/Development/temp/nextls-bug/foo/mix.exs","version":0}}}
2023-11-14T15:04:32.728 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] NextLS v0.15.0 has initialized!","type":4}}
2023-11-14T15:04:32.728 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] NextLS v0.15.0 has initialized!" }
2023-11-14T15:04:32.730 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] [extension] Credo initializing with options %NextLS.InitOpts.Extensions.Credo{enable: true, cli_options: []}","type":4}}
2023-11-14T15:04:32.730 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] [extension] Credo initializing with options %NextLS.InitOpts.Extensions.Credo{enable: true, cli_options: []}" }
2023-11-14T15:04:32.734 helix_lsp::transport [INFO] nextls <- {"id":66,"jsonrpc":"2.0","method":"client/registerCapability","params":{"registrations":[{"id":"file-watching","method":"workspace/didChangeWatchedFiles","registerOptions":{"watchers":[{"globPattern":"**/*.ex","kind":7},{"globPattern":"**/*.exs","kind":7},{"globPattern":"**/*.leex","kind":7},{"globPattern":"**/*.eex","kind":7},{"globPattern":"**/*.heex","kind":7},{"globPattern":"**/*.sface","kind":7}]}}]}}
2023-11-14T15:04:32.734 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","result":null,"id":66}
2023-11-14T15:04:32.734 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Booting runtimes...","type":4}}
2023-11-14T15:04:32.734 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Booting runtimes..." }
2023-11-14T15:04:32.770 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"2EoJoT1c","value":{"kind":"begin","title":"Initializing NextLS runtime for folder foo..."}}}
2023-11-14T15:04:32.786 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Beginning DB migration...","type":4}}
2023-11-14T15:04:32.786 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Beginning DB migration..." }
2023-11-14T15:04:32.787 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Database is being upgraded from version 0 to 5.\n\nThis will trigger a full recompilation in order to re-index your codebase.","type":3}}
2023-11-14T15:04:32.787 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Info, message: "[NextLS] Database is being upgraded from version 0 to 5.\n\nThis will trigger a full recompilation in order to re-index your codebase." }
2023-11-14T15:04:32.788 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Finished DB migration...","type":4}}
2023-11-14T15:04:32.788 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Finished DB migration..." }
2023-11-14T15:04:32.788 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir","type":4}}
2023-11-14T15:04:32.788 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir" }
2023-11-14T15:04:33.813 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Connected to node nextls-runtime-1699970672788421708@Damirs-MacBook-Pro","type":4}}
2023-11-14T15:04:33.813 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Connected to node nextls-runtime-1699970672788421708@Damirs-MacBook-Pro" }
2023-11-14T15:04:33.887 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"2EoJoT1c","value":{"kind":"end","message":"NextLS runtime for folder foo has initialized!"}}}
2023-11-14T15:04:33.887 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Runtime for folder foo is ready...","type":4}}
2023-11-14T15:04:33.887 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Runtime for folder foo is ready..." }
2023-11-14T15:04:33.887 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"mjSJRPYs","value":{"kind":"begin","title":"Compiling foo..."}}}
2023-11-14T15:04:33.907 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 1 file (.ex)","type":4}}
2023-11-14T15:04:33.907 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 1 file (.ex)" }
2023-11-14T15:04:33.922 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"kqrR5R_Z","value":{"kind":"begin","title":"Indexing!"}}}
2023-11-14T15:04:33.951 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Generated foo app","type":4}}
2023-11-14T15:04:33.951 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Generated foo app" }
2023-11-14T15:04:33.952 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiled foo!","type":4}}
2023-11-14T15:04:33.952 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiled foo!" }
2023-11-14T15:04:33.953 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"mjSJRPYs","value":{"kind":"end","message":"Compiled foo!"}}}
2023-11-14T15:04:34.026 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"kqrR5R_Z","value":{"kind":"end","message":"Finished indexing!"}}}
2023-11-14T15:04:36.734 helix_vcs [INFO] file is untracked
2023-11-14T15:04:36.734 helix_vcs [INFO] failed to open diff base for /Users/dvic/.config/cache/helix/helix.log
2023-11-14T15:04:37.775 helix_vcs [INFO] file is untracked
2023-11-14T15:04:37.775 helix_vcs [INFO] failed to open diff base for /Users/dvic/.config/cache/helix/helix.log
2023-11-14T15:04:49.627 helix_vcs [INFO] PeelToCommit(
    Unborn {
        name: FullName(
            "refs/heads/master",
        ),
    },
)
2023-11-14T15:04:49.627 helix_vcs [INFO] failed to open diff base for /Users/dvic/Development/temp/nextls-bug/bar/mix.exs
2023-11-14T15:04:49.627 helix_vcs [INFO] PeelToCommit(
    Unborn {
        name: FullName(
            "refs/heads/master",
        ),
    },
)
2023-11-14T15:04:49.627 helix_vcs [INFO] failed to obtain current head name for /Users/dvic/Development/temp/nextls-bug/bar/mix.exs
2023-11-14T15:04:49.628 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"workspace/didChangeWorkspaceFolders","params":{"event":{"added":[{"name":"bar","uri":"file:///Users/dvic/Development/temp/nextls-bug/bar"}],"removed":[]}}}
2023-11-14T15:04:49.628 helix_lsp::transport [INFO] nextls -> {"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"languageId":"elixir","text":"defmodule Bar.MixProject do\n  use Mix.Project\n\n  def project do\n    [\n      app: :bar,\n      version: \"0.1.0\",\n      elixir: \"~> 1.15\",\n      start_permanent: Mix.env() == :prod,\n      deps: deps()\n    ]\n  end\n\n  # Run \"mix help compile.app\" to learn about applications.\n  def application do\n    [\n      extra_applications: [:logger]\n    ]\n  end\n\n  # Run \"mix help deps\" to learn about dependencies.\n  defp deps do\n    [\n      {:foo, path: \"../foo\"},\n      {:phoenix, \"~> 1.7.6\"},\n      {:phoenix_ecto, \"~> 4.4\"},\n      {:ecto_sql, \"~> 3.10\"},\n      {:postgrex, \">= 0.0.0\"},\n      {:phoenix_html, \"~> 3.3\"},\n      {:phoenix_live_reload, \"~> 1.2\", only: :dev},\n      {:phoenix_live_view, \"~> 0.20.0\"},\n      {:floki, \">= 0.30.0\"},\n      {:esbuild, \"~> 0.7\", runtime: Mix.env() == :dev},\n      {:tailwind, \"~> 0.2.0\", runtime: Mix.env() == :dev},\n      {:telemetry_metrics, \"~> 0.6\"},\n      {:telemetry_poller, \"~> 1.0\"},\n      {:jason, \"~> 1.2\"},\n      {:bandit, \"~> 1.0\"},\n      {:typed_struct, \"~> 0.3.0\"},\n      {:ex_check, \"~> 0.15.0\", only: [:dev], runtime: false},\n      {:credo, \">= 0.0.0\", only: [:dev], runtime: false},\n      {:dialyxir, \">= 0.0.0\", only: [:dev], runtime: false},\n      {:styler, \"~> 0.10.0\", only: [:dev, :test], runtime: false},\n      {:ecto, \"~> 3.10.3\"},\n      {:sentry, \"~> 9.1.0\"},\n      # needed for sentry client\n      {:hackney, \"~> 1.20.1\"},\n      {:logger_json, \"~> 5.1\"},\n      {:logger_backends, \"~> 1.0.0\"},\n      {:tz, \"~> 0.26.2\"},\n      {:typed_ecto_schema, \"~> 0.4.1\"},\n      {:ecto_sqlite3, \"~> 0.12\"}\n    ]\n  end\nend\n","uri":"file:///Users/dvic/Development/temp/nextls-bug/bar/mix.exs","version":0}}}
2023-11-14T15:04:49.632 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Adding workspace folder bar","type":4}}
2023-11-14T15:04:49.632 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"uOz_c9Lz","value":{"kind":"begin","title":"Initializing NextLS runtime for folder bar..."}}}
2023-11-14T15:04:49.632 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Adding workspace folder bar" }
2023-11-14T15:04:49.637 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir","type":4}}
2023-11-14T15:04:49.638 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir" }
2023-11-14T15:04:50.658 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Connected to node nextls-runtime-1699970689637208791@Damirs-MacBook-Pro","type":4}}
2023-11-14T15:04:50.658 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Connected to node nextls-runtime-1699970689637208791@Damirs-MacBook-Pro" }
2023-11-14T15:04:50.732 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"uOz_c9Lz","value":{"kind":"end","message":"NextLS runtime for folder bar has initialized!"}}}
2023-11-14T15:04:50.732 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Runtime for folder bar is ready...","type":4}}
2023-11-14T15:04:50.732 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"p0qxQQCl","value":{"kind":"begin","title":"Compiling bar..."}}}
2023-11-14T15:04:50.732 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Runtime for folder bar is ready..." }
2023-11-14T15:04:50.774 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] ==> typed_struct","type":4}}
2023-11-14T15:04:50.774 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 2 files (.ex)","type":4}}
2023-11-14T15:04:50.774 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] ==> typed_struct" }
2023-11-14T15:04:50.774 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 2 files (.ex)" }
2023-11-14T15:04:50.830 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Generated typed_struct app","type":4}}
2023-11-14T15:04:50.830 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Generated typed_struct app" }
2023-11-14T15:04:50.844 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] ==> file_system","type":4}}
2023-11-14T15:04:50.844 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 7 files (.ex)","type":4}}
2023-11-14T15:04:50.844 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] ==> file_system" }
2023-11-14T15:04:50.845 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 7 files (.ex)" }
2023-11-14T15:04:50.909 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Generated file_system app","type":4}}
2023-11-14T15:04:50.909 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Generated file_system app" }
2023-11-14T15:04:50.933 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] ==> floki","type":4}}
2023-11-14T15:04:50.933 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 2 files (.erl)","type":4}}
2023-11-14T15:04:50.933 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] ==> floki" }
2023-11-14T15:04:50.933 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 2 files (.erl)" }
2023-11-14T15:04:51.103 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 29 files (.ex)","type":4}}
2023-11-14T15:04:51.103 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 29 files (.ex)" }
2023-11-14T15:04:51.133 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] The runtime for bar has successfully shut down.","type":4}}
2023-11-14T15:04:51.133 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"p0qxQQCl","value":{"kind":"end"}}}
2023-11-14T15:04:51.133 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] The runtime for bar has successfully shut down." }
2023-11-14T15:04:51.134 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir","type":4}}
2023-11-14T15:04:51.134 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir" }
2023-11-14T15:04:51.136 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Bad RPC call to node nextls-runtime-1699970689637208791@Damirs-MacBook-Pro: :nodedown","type":1}}
2023-11-14T15:04:51.136 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Error, message: "[NextLS] Bad RPC call to node nextls-runtime-1699970689637208791@Damirs-MacBook-Pro: :nodedown" }
2023-11-14T15:04:52.153 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Connected to node nextls-runtime-1699970691134216833@Damirs-MacBook-Pro","type":4}}
2023-11-14T15:04:52.153 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Connected to node nextls-runtime-1699970691134216833@Damirs-MacBook-Pro" }
2023-11-14T15:04:52.226 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"uOz_c9Lz","value":{"kind":"end","message":"NextLS runtime for folder bar has initialized!"}}}
2023-11-14T15:04:52.226 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Runtime for folder bar is ready...","type":4}}
2023-11-14T15:04:52.226 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"3Ia9PlhL","value":{"kind":"begin","title":"Compiling bar..."}}}
2023-11-14T15:04:52.226 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Runtime for folder bar is ready..." }
2023-11-14T15:04:52.276 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] ==> floki\nCompiling 2 files (.erl)","type":4}}
2023-11-14T15:04:52.276 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] ==> floki\nCompiling 2 files (.erl)" }
2023-11-14T15:04:52.451 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 29 files (.ex)","type":4}}
2023-11-14T15:04:52.451 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 29 files (.ex)" }
2023-11-14T15:04:52.530 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] The runtime for bar has successfully shut down.","type":4}}
2023-11-14T15:04:52.530 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"3Ia9PlhL","value":{"kind":"end"}}}
2023-11-14T15:04:52.530 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] The runtime for bar has successfully shut down." }
2023-11-14T15:04:52.531 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir","type":4}}
2023-11-14T15:04:52.531 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir" }
2023-11-14T15:04:52.533 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Bad RPC call to node nextls-runtime-1699970691134216833@Damirs-MacBook-Pro: :nodedown","type":1}}
2023-11-14T15:04:52.533 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Error, message: "[NextLS] Bad RPC call to node nextls-runtime-1699970691134216833@Damirs-MacBook-Pro: :nodedown" }
2023-11-14T15:04:53.551 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Connected to node nextls-runtime-1699970692530795375@Damirs-MacBook-Pro","type":4}}
2023-11-14T15:04:53.552 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Connected to node nextls-runtime-1699970692530795375@Damirs-MacBook-Pro" }
2023-11-14T15:04:53.625 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"uOz_c9Lz","value":{"kind":"end","message":"NextLS runtime for folder bar has initialized!"}}}
2023-11-14T15:04:53.625 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Runtime for folder bar is ready...","type":4}}
2023-11-14T15:04:53.625 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"MCMkkW_X","value":{"kind":"begin","title":"Compiling bar..."}}}
2023-11-14T15:04:53.625 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Runtime for folder bar is ready..." }
2023-11-14T15:04:53.677 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] ==> floki","type":4}}
2023-11-14T15:04:53.677 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 2 files (.erl)","type":4}}
2023-11-14T15:04:53.677 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] ==> floki" }
2023-11-14T15:04:53.677 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 2 files (.erl)" }
2023-11-14T15:04:53.854 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Compiling 29 files (.ex)","type":4}}
2023-11-14T15:04:53.854 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Compiling 29 files (.ex)" }
2023-11-14T15:04:53.933 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] The runtime for bar has successfully shut down.","type":4}}
2023-11-14T15:04:53.933 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"$/progress","params":{"token":"MCMkkW_X","value":{"kind":"end"}}}
2023-11-14T15:04:53.933 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] The runtime for bar has successfully shut down." }
2023-11-14T15:04:53.934 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir","type":4}}
2023-11-14T15:04:53.934 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Log, message: "[NextLS] Using `elixir` found at: /Users/dvic/.asdf/shims/elixir" }
2023-11-14T15:04:53.936 helix_lsp::transport [INFO] nextls <- {"jsonrpc":"2.0","method":"window/logMessage","params":{"message":"[NextLS] Bad RPC call to node nextls-runtime-1699970692530795375@Damirs-MacBook-Pro: :nodedown","type":1}}
2023-11-14T15:04:53.936 helix_term::application [INFO] window/logMessage: LogMessageParams { typ: Error, message: "[NextLS] Bad RPC call to node nextls-runtime-1699970692530795375@Damirs-MacBook-Pro: :nodedown" }
```
