# Using AI to Complete Exercises

> Built with Flutter + BLoC, developed entirely with AI support for an intern test.

---

## Contents
- [Project Overview](#project-overview)
- [Part 1 - Platform (AI-First Thinking)](#part-1--platform-ai-first-thinking)
- [Part 2 - Source Control (AI Usage)](#part-2--source-control-ai-usage)
- [Part 3 - Structure & Architecture](#part-3--structure--architecture)
- [Implementation & Debug Log](#implementation--debug-log)
- [Demo App & Setup](#demo-app--setup)

---

## Project Overview

A Flutter application consisting of two main screens:
- **Login Screen** - Email/password validation, mock authentication, error display via SnackBar.
- **Contact List Screen** - 12 mock contacts, real-time search, detailed view via bottom sheet, logout.

---

## Part 1 - Platform (AI-First Thinking)

### 1.1 Using AI for Fast Learning

Instead of reading all documentation from scratch, I used a **targeted learning** strategy:

1. **AI Explanation of Core Concepts** (Widget tree, StatelessWidget vs StatefulWidget, hot reload).
2. **AI Comparison** with known frameworks to grasp concepts faster.
3. **AI Sample Code Generation** -> run tests -> follow-up on errors.
4. **Official Documentation Cross-Check** to verify AI explanations.

This approach allowed me to understand Flutter fundamentals in 1 day.

### 1.2 Prompt: Learning Flutter in 1 Day

**Prompt Used:**
```
You are a senior Flutter engineer and an expert in fast-track teaching.

I want to learn Flutter in 1 day (intensive crash course).

I am a complete beginner with NO background in Dart or mobile development.

Goal:
- Understand Flutter fundamentals
- Be able to build a simple but complete app

Constraints:
- Focus only on the most important 20% knowledge
- Skip unnecessary theory
- Teach in a fast, practical way
- I learn by doing, not reading

Teaching plan:
1. Give me a 6–8 hour roadmap divided into time blocks
2. Teach step-by-step in order
3. Each step must include:
   - Concept (very short, 2–3 lines max)
   - Example code
   - Simple explanation
   - A small task for me to do immediately
4. After each task, STOP and wait for my response before continuing

Must include:
- Dart basics (only essentials)
- Flutter basics (widgets, layout)
- Navigation between screens
- Build UI (clean and simple)
- Fetch data from an API
- Basic state management (setState only)
- Build 1 final mini project:
   (Example: Todo App or simple app with API)

Extra rules:
- Always explain like I'm a beginner
- Point out common mistakes
- Help debug errors step-by-step
- Keep everything simple and practical
```

**Results:** 
- Clear & Structured: Roadmap divided by hour (Hour 1 to Hour 8), easy to follow.
- Targeted: Focused on core topics (Dart basics, widgets, navigation, state, API).
- Practical: Real tasks after each concept, learning-by-doing approach.
- Beginner Friendly: Short explanations, avoiding jargon.

---

### 1.3 How to Validate AI Results

**My Principle:** Do not accept/add code to the project unless you understand why the AI wrote it that way.

1. **Run Actual Code:**
   Copy AI code -> run immediately in the project. Check for compile errors, runtime crashes.
2. **Verify Logic:**
   Check if the app meets requirements: login validation, loading/error states, correct contact display.
3. **Compare with Documentation:**
   Cross-reference with official Flutter docs (https://flutter.dev/docs).
4. **Request AI Self-Correction:**
   Use specific prompts for AI to evaluate its own work and find hidden risks.
5. **Compare Multiple Approaches:**
   Ask AI for 2-3 different solutions and compare them based on simplicity and maintainability.

---

## Part 2 - Source Control (AI Usage)

### 2.1 Using AI to Define Git Workflow

**AI Proposed Workflow applied to this project:**

**Branch Structure:**
```
main                    <- main branch, stable, only contains reviewed code
└── develop             <- integration branch, merge features here before main
    ├── login            <- login feature
    ├── contact          <- contact list feature
    ├── fix/state-bug    <- fix BLoC state emission bug
    └── docs/readme      <- documentation update
```

**Naming Convention:**
```
feature/<feature-name>    -> feature/login, feature/contact
fix/<bug-description>     -> fix/state-not-emit
docs/<doc-name>           -> docs/readme
chore/<task>              -> chore/update-dependencies
```

**Commit Convention (Conventional Commits):**
```
feat: add login screen with form validation
fix: add await to authRepository to fix state emission bug
refactor: extract ContactCard widget to separate file
docs: update README AI usage section
chore: add flutter_bloc, equatable to pubspec.yaml
```

**Merge Strategy:**
- Create Pull Request (PR) from `feature/*` -> `develop`.
- At least 1 review required.
- Merge `develop` -> `main` when features are finalized.

### 2.2 Using AI to Resolve Merge Conflicts

Instead of guessing which version to keep, I used AI as a "consultant" that understands the code. AI helps explain *why* a certain version should be kept, helping me learn from the conflict.

---

### 2.3 Prompt: Resolving Git Conflicts

**Prompt Generation Strategy:**

**Prompt Version 1 (V1):**
- Simple request for code resolution.
- Resulting in inconsistent formatting and lack of context explanation.

**Prompt Version 2 (V2):**
```
You are a senior software engineer.

I have a Git merge conflict in my project:

[paste conflict code]

Tasks:
1. Explain why the conflict happened (in simple terms)
2. Compare both versions and highlight differences
3. Analyze the intent of each change
4. Provide a correct merged version that preserves logic
5. List potential risks after merging
6. Suggest how to test to ensure nothing is broken

Constraints:
- Do not remove code unless necessary
- Keep the final code clean and readable
- Preserve business logic

Output format:
- Cause of conflict
- Differences
- Merged code
- Risks
- Test suggestions
```

### 2.4 When AI Can Be Wrong in Git

AI **does not know the real context of the project** — this is its biggest weakness in Git usage. AI can suggest incorrect business logic or dangerous commands like force push without warning about data loss. Always run `git status` and `git log` to confirm the actual state of the repository first.

---

## Part 3 - Structure & Architecture

### 3.1 Learning BLoC with AI

**AI Learning Strategy (v2):**

**1. BLoC in simple terms (<= 5 lines):**
```
BLoC = separates UI from logic
UI doesn't change data directly
UI sends Events
BLoC processes and outputs States
UI rebuilds based on new State
```

**2. Data flow:**
```
Button Click (UI)
      ↓
   Event (Increment)
      ↓
   Bloc (Business Logic)
      ↓
   State (count = 1)
      ↓
   UI update

- UI -> Event -> Bloc -> State -> UI
```

**3. Minimal Working Example (Counter):**
```dart
// Event
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}

// State
class CounterState {
  final int count;
  CounterState(this.count);
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}

// UI
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => Text('${state.count}',
              style: TextStyle(fontSize: 40)),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.add(IncrementEvent()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => bloc.add(DecrementEvent()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
```

**4. Component Explanation:**
- **Event** (Input) = User actions -> `IncrementEvent`, `DecrementEvent`.
- **State** (Output) = Data for the UI -> `count`.
- **Bloc** (The Brain) = Processes Events -> Performs Logic -> Emits new States.

**5. When to use BLoC vs NOT:**
- Use BLoC for large systems and shared state.
- Avoid BLoC for simple UI-only logic (use `setState`).

### 3.2 BLoC vs MVVM Comparison

- **BLoC:** UI -> dispatch(Event) -> Bloc -> emit(State) -> UI rebuild (Unidirectional).
- **MVVM:** UI -> vm.method() -> data changes -> notifyListeners() -> UI rebuild.
- **Decision:** BLoC is better for consistency and scalability in large teams, while MVVM is better for fast prototyping in smaller projects.

---

## AI Implementation Log

### Development Phases
1. **Planning:** AI used for folder structure (Feature-First) and Data Flow design.
2. **Implementation:** AI-assisted development of Auth Repository, BLoC, and Material 3 UI.
3. **Integration:** Git merge flow via `develop` branch and Global state management using `MultiBlocProvider`.

### Debugging Log

- **Issue 1:** Build error `ContactModel isn't a type`.
- **Root Cause:** Missing model file after branch merge.
- **Solution:** Re-generated and verified the Domain model.

- **Issue 2:** Dependency loss in `pubspec.yaml` after branch switching.
- **Solution:** Added `flutter_bloc`, `equatable`, and `uuid` to the manifest.

- **Issue 3:** Recognition failure of classes due to incorrect relative paths.
- **Solution:** Fixed manual imports to follow `../bloc/` architecture.

---

## Demo App & Setup

### Directory Structure
```
lib/
├── core/
│   └── theme/          <- Material 3 Theme
├── features/
│   ├── auth/           <- Authentication (Login, Bloc, Data)
│   └── contacts/       <- Contacts (Search, List, Bloc, Data)
└── main.dart           <- Global Providers & App Entry
```

### Core Features
- **Login Screen:** Email/Password validation, loading states, error SnackBar.
- **Contact List Screen:** Real-time search, Detailed BottomSheet, Logout.

### Setup & Run
```bash
git clone https://github.com/<your-username>/flutter_with_ai.git
cd flutter_with_ai
flutter pub get
flutter run
```

**Test Account:**
- Email: `test@example.com`
- Password: `password123`

---

*Verified by the author — every line of code is reviewed and tested.*
