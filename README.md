# Flutter with AI - Bai Tap Su dung AI

> Xay dung bang Flutter + BLoC, phat trien hoan toan voi su ho tro cua AI.

---

## Muc luc
- [Tổng quan ứng dụng](#tổng-quan-ứng-dụng)
- [Phần 1 – Platform (AI-First Thinking)](#phần-1--platform-ai-first-thinking)
- [Phần 2 – Source Control (AI Usage)](#phần-2--source-control-ai-usage)
- [Phần 3 – Cấu trúc & Kiến trúc](#phần-3--cấu-trúc--kiến-trúc)
- [Ứng dụng demo](#ứng-dụng-demo)
- [Cài đặt & Chạy](#cài-đặt--chạy)

---

## Tong quan ung dung

Ứng dụng Flutter gồm 2 màn hình chính:
- **Màn hình Đăng nhập** – kiểm tra email/mật khẩu, xác thực mock, hiển thị lỗi qua SnackBar
- **Màn hình Danh sách liên hệ** – 12 contact mock, tìm kiếm real-time, xem chi tiết qua bottom sheet, đăng xuất

---

## Phần 1 – Platform (AI-First Thinking)

### 1.1 Dùng AI để học Flutter nhanh

Thay vì đọc toàn bộ tài liệu từ đầu, mình dùng AI theo chiến lược **học có mục tiêu**:

1. **Nhờ AI giải thích các khái niệm cốt lõi** trước (Widget tree, StatelessWidget vs StatefulWidget, hot reload)
2. **Nhờ AI so sánh** với các framework mình đã biết để nắm nhanh hơn
3. **Nhờ AI tạo code mẫu** → chạy thử → hỏi tiếp khi gặp lỗi
4. **Đọc tài liệu chính thống** để xác nhận những gì AI giải thích là đúng

Cách tiếp cận này giúp mình hiểu Flutter trong 1 ngày thay vì mất nhiều ngày đọc docs từ đầu đến cuối.

---

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

## Phần 2 – Source Control (AI Usage)

### 2.1 Dùng AI tạo quy trình làm việc với Git

**Prompt đã dùng:**
```
You are a senior developer.

Suggest a Git workflow for a small team building a Flutter app.

Requirements:
- 3-5 developers
- Use feature branches
- Ensure code review before merge
- Keep main branch stable

Explain:
- Branch structure
- Naming convention
- Merge strategy
```

**Kết quả AI đề xuất và mình áp dụng cho project:**

**Cấu trúc nhánh:**
```
main                    ← nhánh chính, luôn ổn định, chỉ chứa code đã review
└── develop             ← nhánh tích hợp, merge feature vào đây trước khi lên main  
    ├── feature/login         ← tính năng đăng nhập
    ├── feature/contact-list  ← danh sách liên hệ
    ├── fix/state-not-emit    ← sửa bug BLoC không emit state
    └── docs/readme           ← cập nhật tài liệu
```

**Quy tắc đặt tên nhánh:**
```
feature/<tên-tính-năng>   →  feature/login, feature/contact-list
fix/<mô-tả-bug>           →  fix/state-not-emit, fix/login-validation
docs/<tên-tài-liệu>       →  docs/readme
chore/<công-việc>         →  chore/update-dependencies
```

**Quy tắc viết commit (Conventional Commits):**
```
feat: thêm màn hình đăng nhập với form validation
fix: thêm await vào authRepository để fix lỗi state không emit
refactor: tách widget ContactCard thành file riêng
docs: cập nhật README phần AI usage
chore: thêm flutter_bloc, equatable vào pubspec.yaml
```

**Chiến lược merge:**
- Tạo Pull Request (PR) từ `feature/*` → `develop`
- Cần ít nhất 1 người review trước khi merge
- Merge `develop` → `main` khi hoàn chỉnh tính năng

**AI Validate lại:** Mình kiểm tra quy trình này với thực tế dự án — phù hợp với team 3-5 người và đảm bảo nhánh `main` luôn ổn định.

**Đánh giá kết quả:** đáp ứng tốt yêu cầu cơ bản, nhưng cần cải tiến để đạt mức production-ready
**Nâng cấp Prompt:**
```
You are a senior developer with real-world experience managing production teams.

Suggest a Git workflow for a small team building a Flutter app.

Requirements:
- 3-5 developers
- Use feature branches
- Ensure code review before merge
- Keep main branch stable

Explain:
- Branch structure
- Naming convention
- Merge strategy

Then:
1. Critically evaluate your own solution:
   - What are the weaknesses?
   - What problems might happen in real projects?

2. Improve the workflow to be closer to production-ready:
   - Add branch protection rules
   - Add CI/CD checks (Flutter specific)
   - Add rebase strategy
   - Add hotfix flow

3. Provide final recommended version (clean and optimized)
```

**Kết quả AI trả về (production-ready version):**

**Điểm yếu của workflow cơ bản (AI tự đánh giá):**
- Không có branch protection → ai cũng có thể push thẳng lên `main`
- Không có CI/CD → merge code lỗi mà không biết
- Không có hotfix flow → khi có bug production, không biết xử lý thế nào
- Thiếu rebase strategy → commit history lộn xộn theo thời gian

**Workflow nâng cấp – final recommended version:**

```
main        ← protected, chỉ merge từ develop (qua PR + CI pass)
├── develop ← protected, chỉ merge từ feature/* (qua PR + 1 reviewer)
│   ├── feature/login
│   ├── feature/contact-list
│   └── fix/state-bug
└── hotfix/critical-bug  ← tạo từ main, merge thẳng về main + develop
```

**Branch protection rules (cài trên GitHub):**
- `main`: yêu cầu PR + CI pass + 1 approval, không cho force push
- `develop`: yêu cầu PR + 1 approval

**CI/CD checks cho Flutter:**
```yaml
# Chạy tự động khi tạo PR
- flutter analyze        # kiểm tra lỗi code
- flutter test           # chạy unit test
- flutter build apk      # đảm bảo build không bị lỗi
```

**Rebase strategy:**
```bash
# Trước khi tạo PR, luôn rebase lên develop mới nhất
git fetch origin
git rebase origin/develop
# → giữ commit history sạch, tuyến tính
```

**Hotfix flow (khi có bug trên production):**
```bash
git checkout -b hotfix/ten-bug main  # tạo từ main
# sửa bug...
git checkout main && git merge hotfix/ten-bug  # merge lên main
git checkout develop && git merge hotfix/ten-bug  # sync về develop
git tag v1.0.1  # đánh version
```

**Validate lại:** Workflow nâng cấp này sát với thực tế hơn — CI/CD tự động phát hiện lỗi trước khi merge, hotfix flow giải quyết được tình huống khẩn cấp trên production.

---

### 2.2 Dùng AI giải quyết xung đột khi merge

Khi gặp merge conflict, thay vì tự đoán nên giữ version nào, mình dùng AI như một "người tư vấn" hiểu code:

1. **Paste đoạn conflict vào AI** kèm mô tả ngắn về 2 nhánh đang làm gì
2. **Hỏi AI phân tích:** Hai thay đổi có mâu thuẫn nhau không? Nên giữ cái nào?
3. **Đọc giải thích của AI** → hiểu lý do → tự quyết định (không làm theo mù quáng)
4. **Áp dụng, chạy lại app** để xác nhận không bị lỗi, rồi commit

> **Điểm quan trọng:** AI giúp giải thích *tại sao* nên giữ version nào — giúp mình học được từ conflict thay vì chỉ chọn đại.

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

**Câu trả lời AI (version 1):**

BLoC (Business Logic Component) là một pattern giúp tách biệt logic xử lý ra khỏi UI. Thay vì để UI tự xử lý dữ liệu, UI chỉ gửi Event và nhận State để hiển thị.

- **Event**: Hành động người dùng thực hiện (nhấn nút, nhập text)
- **State**: Kết quả cần hiển thị lên màn hình (loading, thành công, lỗi)
- **Bloc**: Nơi nhận Event, xử lý logic, rồi emit State mới

Ví dụ counter với `flutter_bloc 8.x`:
```dart
// Event
abstract class CounterEvent {}
class Increment extends CounterEvent {}

// State
class CounterState {
  final int count;
  CounterState(this.count);
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.count + 1)));
  }
}
```
**Equatable** giúp so sánh 2 State — nếu State mới giống State cũ thì UI không rebuild lại, tiết kiệm hiệu năng.

**Đánh giá version 1:**
- **Không có teaching style** — AI giải thích theo cách riêng, đôi khi quá hàn lâm với người mới
- **Không có bài tập thực hành** — đọc xong nhưng không biết áp dụng ngay
- **Không hỏi khi nào KHÔNG dùng BLoC** — chỉ biết dùng mà không biết giới hạn

→ **Nâng cấp lên version 2 để học thực tế hơn**

---

**Prompt version 2:**
```
You are a senior Flutter developer and a great teacher.

I want to understand BLoC (Business Logic Component) in Flutter.

Requirements:
- Explain BLoC in simple terms (max 5 lines)
- Show how data flows (Event → Bloc → State → UI)
- Provide a minimal working example
- Explain each part: Event, State, Bloc
- Show when to use BLoC and when NOT to use it

Teaching style:
- Step-by-step
- Focus on practical understanding
- Avoid unnecessary theory

After explanation:
- Give me a small practice task
- Ask me to modify the code

Start with a simple counter example.
```

**Câu trả lời AI (version 2):**

**1. BLoC in simple terms (≤ 5 lines):**
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
   Bloc (xử lý logic)
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

**4. Giải thích từng phần:**
- **Event** (Input) = hành động người dùng → `IncrementEvent`, `DecrementEvent`
- **State** (Output) = dữ liệu hiện tại cho UI → `count`
- **Bloc** (Brain) = nhận Event → xử lý logic → emit State mới

**5. When to use BLoC vs NOT:**

Dung BLoC khi:
- App có nhiều màn hình, cần share state
- Logic phức tạp, cần clean architecture
- Team project, dễ maintain

Tranh BLoC khi:
- App đơn giản (counter nhỏ, CRUD đơn)
- Boilerplate quá nhiều cho logic nhỏ
- `setState` hoặc Provider là đủ

**6. Practice Task:**
> Thêm Reset button — tạo `ResetEvent`, xử lý trong Bloc để `count = 0`

**7. Challenge:**
> Thêm button "Double" → `count * 2`. Gợi ý: tạo `DoubleEvent`, handle trong Bloc.

**Đánh giá version 2:**
- **Có teaching style rõ ràng** → AI điều chỉnh cách giải thích phù hợp người mới
- **Có bài tập ngay sau giải thích** → học đi đôi với hành, không học chay
- **Hỏi cả khi KHÔNG nên dùng** → hiểu được giới hạn của pattern
- **Output có cấu trúc từng bước** → dễ follow hơn v1 rất nhiều

**Validate lại:** Đọc [bloclibrary.dev](https://bloclibrary.dev) — AI đúng về concept nhưng ban đầu sinh code theo syntax cũ (v6 — `mapEventToState`). Phải thêm `flutter_bloc 8.x` vào prompt mới ra đúng pattern `on<Event>`.

---


### 3.2 So sánh BLoC vs MVVM (có chứng minh)

**Prompt đã dùng:**
```
You are a senior software architect.

Compare BLoC and MVVM architecture in Flutter.

Requirements:
- Explain both BLoC and MVVM briefly
- Compare them based on: Structure, Data flow, Complexity, Testability, Scalability
- Provide a real example (counter app)
- Show sample code for BOTH architectures
- Show data flow diagram

Output format:
1. BLoC explanation
2. MVVM explanation
3. Comparison with reasoning
4. Code example (BLoC version + MVVM version)
5. Data flow diagram
6. Conclusion: when to use each
```

**Câu trả lời AI:**


**BLoC version:**
```dart
// Event
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}

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
  }
}

// UI
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) => Text('${state.count}'),
)
ElevatedButton(
  onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
  child: Text('Increment'),
)
```

**MVVM version:**
```dart
// ViewModel
class CounterViewModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

// UI
ChangeNotifierProvider(
  create: (_) => CounterViewModel(),
  child: Consumer<CounterViewModel>(
    builder: (context, vm, _) => Column(
      children: [
        Text('${vm.count}'),
        ElevatedButton(
          onPressed: vm.increment,
          child: Text('Increment'),
        ),
      ],
    ),
  ),
)
```

**5. Data flow diagram:**
```
── BLoC ──────────────────────────────────────
UI → dispatch(IncrementEvent) → Bloc → emit(CounterState) → UI rebuild

── MVVM ──────────────────────────────────────
UI → vm.increment() → count++ → notifyListeners() → UI rebuild
```

**6. Kết luận – khi nào dùng cái nào:**

**Chọn BLoC khi:**
- Hệ thống lớn, có nhiều State phức tạp cần quản lý.
- Cần đảm bảo tính nhất quán (Pattern-based) trong môi trường làm việc nhóm.
- Đặt ưu tiên cao cho việc Unit Test các logic xử lý dữ liệu.

**Chọn MVVM khi:**
- Dự án quy mô nhỏ hoặc trung bình, cần tốc độ phát triển (Time-to-market) nhanh.
- Cấu trúc dữ liệu đơn giản, không có quá nhiều ràng buộc phức tạp.
- Đội ngũ phát triển đã quen thuộc với mô hình ViewModel/Binding truyền thống.

**7. Xác thực & Kiểm chứng (Validation):**

Để đảm bảo những so sánh trên của AI, mình đã thực hiện các bước kiểm chứng sau:

- **Đối chiếu Documentation:** Mình so sánh định nghĩa BLoC của AI với trang chủ https://bloclibrary.dev. AI phản hồi chính xác về mô hình *Event-in, State-out*.
- **Kiểm tra tính nhất quán:** AI chỉ ra BLoC giúp tránh side-effect nhờ luồng một chiều. Điều này đúng với thực tế Flutter vì Widget chỉ nên rebuild khi State thay đổi, không nên trigger logic lồng nhau.
- **Đánh giá rủi ro:** AI cảnh báo MVVM dễ bị "fat ViewModel". Điều này hoàn toàn hợp lý vì không có ràng buộc phân chia Event/State rõ ràng như BLoC, lập trình viên rất dễ "nhồi nhét" mọi logic vào một nơi.

> **Kết luận kiểm chứng:** Nội dung AI cung cấp là đáng tin cậy

---

---

## AI Implementation Log

### Giai đoạn 1: Lên kế hoạch & Setup (Planning)

**Bước 1: Xác định cấu trúc thư mục (Clean Architecture & BLoC)**
- Mình yêu cầu AI đề xuất cấu trúc dự án tuân thủ **Clean Architecture** kết hợp với **BLoC pattern**, được tổ chức theo hướng **Feature-First**:
    - **Domain Layer:** Chứa Model/Entities (`id`, `name`, `email`...).
    - **Data Layer:** Chứa Repository để tách biệt logic lấy dữ liệu (Mock API) khỏi ứng dụng.
    - **Presentation Layer:** Chứa BLoC (State Management) và UI (Pages/Widgets).
- Cách tổ chức folder theo **Feature-First** (`auth`, `contacts`) giúp ứng dụng cực kỳ linh hoạt và dễ dàng mở rộng sang các tính năng khác mà không làm rối cấu trúc cũ.

**Bước 2: Thiết kế luồng dữ liệu (Data Flow)**
- **Feature Login:** `AuthEvent` (Login/Logout) → `AuthBloc` (gọi mock API) → `AuthState` (Success/Failure) → UI chuyển màn hình.
- **Feature Contacts:** `ContactEvent` (Load/Search) → `ContactBloc` (lọc dữ liệu) → `ContactState` (Loaded/Empty).

**Bước 3: Chọn UI/UX Style (Material 3)**
- Sử dụng Material 3 với hệ thống màu sắc nhất quán.
- Mock dữ liệu: 12 contacts để đảm bảo hiển thị đẹp trên danh sách.

**Bước 4: Tổ chức nhánh Git (Git Flow)**
- Để tuân thủ quy trình chuyên nghiệp, mình đã tổ chức các nhánh như sau:
    - `main`: Nhánh ổn định cuối cùng.
    - `develop`: Nhánh tích hợp các tính năng.
    - `login`: Nhánh tính năng Đăng nhập.
    - `contact`: Nhánh tính năng Danh sách liên hệ (tách từ `develop`).
- Mọi tính năng đều được làm trên nhánh riêng và merge vào `develop` sau khi hoàn tất.

### Giai đoạn 2: [Done] Thực hiện tính năng Login
(Nội dung giữ nguyên)

### Giai đoạn 3: [Done] Thực hiện tính năng Danh sách liên hệ
(Nội dung giữ nguyên)

### Giai đoạn 4: Tích hợp & Kiểm chứng (Integration)

- **Quy trình Merge:**
    1. Hoàn thiện Login trên nhánh `login` → Merge vào `develop`.
    2. Tách nhánh `contact` từ `develop`.
    3. Hoàn thiện Contact List → Merge ngược lại vào `develop`.
- **Kết nối BLoC:** Sử dụng `MultiBlocProvider` tại `main.dart` để quản lý toàn bộ State.
- **Điều hướng:** Khi `AuthState` là `Success`, ứng dụng tự động điều hướng sang `ContactListPage`.
- **Đăng xuất:** Tích hợp nút Logout tại trang danh sách, xóa trạng thái Auth và quay về màn hình đăng nhập.

### Nhat ky Debug (Debugging Log)

Mục này ghi lại các lỗi phát sinh trong quá trình phát triển và cách AI đã xử lý chúng.

- **Vấn đề 1:** Lỗi build `ContactModel isn't a type` và các lỗi Type liên quan (`ContactLoading`, `ContactLoaded`).
- **Nguyên nhân:** File `contact_model.dart` bị mất trong quá trình tổ chức lại các nhánh Git (untracked files).
- **Giải pháp:** Khôi phục file `ContactModel` trong thư mục `domain` và kiểm tra lại toàn bộ import.
- **Trạng thái:** ✅ Fixed

- **Vấn đề 2:** Lỗi `Target of URI doesn't exist: 'package:flutter_bloc/flutter_bloc.dart'`.
- **Nguyên nhân:** File `pubspec.yaml` bị mất các dependencies quan trọng sau khi thay đổi nhánh.
- **Giải pháp:** Thêm lại `flutter_bloc`, `equatable`, `uuid` và chạy `flutter pub get`.
- **Trạng thái:** ✅ Fixed

- **Vấn đề 3:** Lỗi các lớp State và Bloc không được nhận diện dù đã import đúng file.
- **Nguyên nhân:** Sử dụng sai đường dẫn tương đối (relative path) trong `contact_list_page.dart` (thừa cấp thư mục `/presentation`).
- **Giải pháp:** Cập nhật lại import thành `../bloc/...` thay vì `../presentation/bloc/...`.
- **Trạng thái:** ✅ Fixed

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

*Được xây dựng với sự hỗ trợ của AI — mọi dòng code đều được đọc, hiểu và kiểm chứng bởi tác giả.*