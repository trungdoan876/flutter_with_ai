
### 1.2 Prompt học Flutter trong 1 ngày

**Prompt đã dùng:**
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

Output format:
- Time block (e.g., Hour 1–2)
- Concept
- Code
- Explanation
- Task
```

**Kết quả:** 
- Rõ ràng & có cấu trúc: Lộ trình được chia theo từng giờ (Hour 1 → Hour 8), giúp người học dễ theo dõi và không bị quá tải.
- Tập trung đúng trọng tâm: Chỉ chọn các kiến thức cốt lõi (Dart cơ bản, widget, navigation, state, API) → phù hợp mục tiêu học nhanh trong 1 ngày.
- Học đi đôi với hành: Mỗi phần đều có code + task thực hành, giúp người học áp dụng ngay thay vì chỉ đọc lý thuyết.
- Cách dạy phù hợp người mới: Giải thích ngắn gọn, tránh lan man → rất hiệu quả với beginner.

---

### 1.3 Cách kiểm chứng (validate) kết quả AI

 **Nguyên tắc của tôi:** Nếu không hiểu tại sao AI viết code như vậy thì không được accept/add vào project.
'''
1. Chạy code thực tế: 
    Copy code AI → chạy thử ngay trong project
    Kiểm tra:
    - Có lỗi compile không
    - Có crash runtime không
2. Kiểm tra logic hoạt động: 
    Xem app có hoạt động đúng yêu cầu không:
    Login có validate input không
    Có xử lý loading / error state không
    Contact list có hiển thị đúng không
3. So sánh với tài liệu chính thống
    Đối chiếu với documentation Flutter: https://flutter.dev/docs
    Kiểm tra:
    - Cách dùng widget có đúng không
    - Có dùng API lỗi thời không
5. Yêu cầu AI tự kiểm tra lại
Tôi sử dụng prompt để AI tự đánh giá, phát hiện lỗi mà lần đầu AI chưa nhận ra
    Review your previous answer:
    - What might be incorrect?
    - What assumptions are risky?
    - What could break in production?
6. So sánh nhiều cách giải quyết:
    Hỏi AI 2–3 cách khác nhau
    So sánh:
    Cách nào đơn giản hơn
    Cách nào dễ maintain hơn
'''

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

Instead of guessing which version to keep, I used AI as a "consultant" that understands the code:

1. **Paste conflict block into AI** with a brief description of the branches' purposes.
2. **Request AI Analysis:** Are the changes contradictory? Which one should be kept?
3. **Read AI Explanation** -> understand reasoning -> make decision.
4. **Apply, run app** to confirm, then commit.

**Key point:** AI helps explain *why* a certain version should be kept, helping me learn from the conflict.

---

### 2.3 Prompt để sửa lỗi xung đột Git

**Prompt version 1:**
```
Tôi đang gặp xung đột khi merge trong file [tên file].

Đây là nội dung xung đột:
<<<<<<< HEAD (nhánh của tôi: feature/login)
[paste code của nhánh bạn]
=======
[paste code của nhánh kia]
>>>>>>> main

Ngữ cảnh:
- Nhánh của tôi: [mô tả nhánh đang làm gì]
- Nhánh main: [mô tả main đã thay đổi gì]
- Mục đích của file này: [mô tả chức năng file]

Hãy:
1. Giải thích mỗi version đang cố làm gì
2. Đề xuất giữ version nào và tại sao
3. Nếu có thể, gợi ý cách kết hợp cả hai version
4. Chỉ ra rủi ro nếu mình chọn nhầm version
```

**Đánh giá version 1:**
- **Output không có cấu trúc** — AI trả lời tự do, đôi khi lan man, khó đọc lại
- **Không có constraints** — AI đôi khi tự ý xóa code hoặc refactor vượt quá yêu cầu
- **Thiếu bước test** — resolve xong không biết kiểm tra thế nào để chắc không bị lỗi

→ **Nâng cấp lên version 2 để khắc phục 3 vấn đề trên**

---

**Prompt version 2:**
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

**Đánh giá version 2:**
- **Output có format rõ ràng** → dễ đọc, dễ follow từng bước
- **Có constraints cụ thể** → AI không tự ý xóa code hay refactor ngoài yêu cầu
- **Có bước test suggestion** → biết cách verify sau khi resolve
- **Tiếng Anh** → AI hiểu chính xác hơn, ít bị hiểu sai intent

---

### 2.4 Khi nào AI có thể sai trong Git

AI **không biết ngữ cảnh thực tế của dự án** — đây là điểm yếu lớn nhất khi dùng AI cho Git.

**Một số trường hợp điển hình:**
- Merge conflict về logic nghiệp vụ: AI không hiểu quy tắc nghiệp vụ → có thể chọn sai version code
- Hoàn tác commit (`git reset`, `git revert`): AI không biết commit đó ảnh hưởng gì tới các nhánh khác
- Force push (`git push --force`): AI có thể gợi ý mà không cảnh báo về việc mất code của người khác
- Xóa nhánh: AI không biết nhánh đó có đang được dùng ở môi trường khác không
- Phiên bản lệnh Git: Một số cú pháp có thể khác nhau giữa các phiên bản Git

> **Nguyên tắc:** Với Git, AI chỉ là công cụ hỗ trợ — luôn chạy `git status` và `git log` để xác nhận trạng thái thực tế trước khi thực thi lệnh AI gợi ý. AI giúp làm việc với Git nhanh hơn, nhưng nếu không kiểm chứng, nó cũng có thể khiến mất code.

---

## Phần 3 – Cấu trúc & Kiến trúc

### 3.1 Dùng AI để học BLoC

**Prompt version 1:**
```
Hãy giải thích mô hình BLoC trong Flutter cho tôi như thể tôi chưa biết gì về nó.
Bao gồm:
1. BLoC giải quyết vấn đề gì?
2. Ba khái niệm cốt lõi: Event, State, Bloc
3. Luồng dữ liệu: UI → Event → Bloc → State → UI
4. Tạo một ví dụ đơn giản: bộ đếm với sự kiện Increment
5. Equatable là gì và tại sao cần dùng với BLoC?
Tech: flutter_bloc 8.x (dùng on<Event> handler, KHÔNG dùng mapEventToState)
```

## Part 3 - Structure & Architecture

### 3.1 Learning BLoC

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

**Use BLoC when:**
- App has many screens and needs to share state.
- Complex logic requiring Clean Architecture.
- Team projects needing maintainable code.

**Avoid BLoC when:**
- Simple apps (e.g., small counter, basic CRUD).
- Boilerplate is too much for simple logic.
- `setState` or Provider is sufficient.

---

### 3.2 BLoC vs MVVM Comparison

**AI Response Summary:**

**BLoC version:** (Standard Event-State flow)
**MVVM version:** (ViewModel with ChangeNotifier/notifyListeners)

**Data flow Comparison:**
- **BLoC:** UI -> dispatch(Event) -> Bloc -> emit(State) -> UI rebuild (Unidirectional).
- **MVVM:** UI -> vm.method() -> data changes -> notifyListeners() -> UI rebuild.

**Conclusion - Choosing the right one:**

**Choose BLoC when:**
- Large systems with complex state management.
- Consistency (Pattern-based) is required for team collaboration.
- High priority on Unit Testing business logic.

**Choose MVVM when:**
- Small to medium projects requiring fast time-to-market.
- Simple data structures with few complex constraints.
- Team is familiar with traditional ViewModel binding.

---

## AI Implementation Log

- **Giải pháp:** Thêm lại `flutter_bloc`, `equatable`, `uuid` và chạy `flutter pub get`.
- **Trạng thái:** Fixed

- **Vấn đề 3:** Lỗi các lớp State và Bloc không được nhận diện dù đã import đúng file.
- **Nguyên nhân:** Sử dụng sai đường dẫn tương đối (relative path) trong `contact_list_page.dart` (thừa cấp thư mục `/presentation`).
- **Giải pháp:** Cập nhật lại import thành `../bloc/...` thay vì `../presentation/bloc/...`.
- **Trạng thái:** Fixed

---

---

## Ứng dụng demo

### Cấu trúc thư mục

```
lib/
├── core/
│   └── theme/          # AppTheme (Material 3)
├── features/
│   ├── auth/
│   │   ├── data/           # AuthRepository (mock)
│   │   ├── domain/         # UserModel
│   │   └── presentation/
│   │       ├── bloc/       # AuthBloc, AuthEvent, AuthState
│   │       └── pages/      # LoginPage
│   └── contacts/
│       ├── data/           # ContactRepository (12 contact mock)
│       ├── domain/         # ContactModel
│       └── presentation/
│           ├── bloc/       # ContactBloc, ContactEvent, ContactState
│           └── pages/      # ContactListPage
└── main.dart
```

### Tính năng đã làm

**Màn hình Đăng nhập:**
- Validate định dạng email và mật khẩu (tối thiểu 6 ký tự)
- Hiển thị loading khi đang xác thực
- SnackBar báo lỗi khi nhập sai thông tin
- Chuyển màn hình khi đăng nhập thành công

**Màn hình Danh sách liên hệ:**
- Hiển thị 12 contact với avatar màu sắc
- Tìm kiếm real-time theo tên, số điện thoại, email
- Nhấn vào contact để xem chi tiết (bottom sheet)
- Nút Đăng xuất quay về màn hình đăng nhập

---

## Cai dat & Chay

```bash
git clone https://github.com/<your-username>/flutter_with_ai.git
cd flutter_with_ai
flutter pub get
flutter run
```

**Tai khoan test:**
- Email: `test@example.com`
- Mat khau: `password123`

---
