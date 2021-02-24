#include <bits/stdc++.h>

using namespace std;

typedef long long ll;
typedef long double ld;
typedef pair<int, int> ii;

template <class T> int getbit(T s, int i) { return (s >> i) & 1; }
template <class T> T onbit(T s, int i) { return s | (T(1) << i); }
template <class T> T offbit(T s, int i) { return s & (~(T(1) << i)); }
template <class T> ll cntbit(T s) { return __builtin_popcountll(s); }

#define all(a) (a).begin(), (a).end()
#define ms(a, x) memset(a, x, sizeof(a))
#define forv(v, it) for(__typeof((v).begin()) it=(v).begin(); it!=(v).end(); it++)
#define clear(x) v.clear(); vector<T>(v).swap(v)

#define ANSI_COLOR_RESET "\x1B[0m"
#define ANSI_COLOR_RED   "\x1B[31m"
#define ANSI_COLOR_BOLD  "\x1B[1m"
#define log_debug(x) cout << __LINE__ << ": " << ANSI_COLOR_BOLD ANSI_COLOR_RED << x << ANSI_COLOR_RESET << endl

#define PI (2 * acos((ld)0))
#define linf (1ll << 60)
#define eps  1e-12

#define div   ___div
#define next  ___next
#define prev  ___prev
#define left  ___left
#define right ___right
#define y0    ___y0
#define y1    ___y1

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);

  log_debug("Hello world");
  log_debug(1);

  return 0;
}
