bool isNumber(string s) {
        int n = s.size();
        int index = 0;
        bool hasDot = false, hasE = false, hasOp = false, hasNum = false;
        while (index < n && s[index] == ' ') ++index;   //去除起始的无效空格
        while (index < n) {
            if (isdigit(s[index])) {
                hasNum = true;
                goto next;
            }
            switch(s[index]){
                case 'e':
                case 'E':
                    if (hasE || !hasNum) return false;
                    hasE = true;
                    hasOp = false; hasDot = false; hasNum = false;
                    break;
                case '+':
                case '-':
                    if (hasOp || hasNum || hasDot) return false;
                    hasOp = true;
                    break;
                case '.':
                    if (hasDot || hasE) return false;
                    hasDot = true;
                    break;
                case ' ':goto next1;            //遍历到空格则跳出循环
                default:return false;
            }
        next:
            ++index;
        }
    next1:
        while (index < n && s[index] == ' ') ++index;
        return hasNum && index == n;        //如果index未越界则表示switch中遍历到的空格并非是字符串的结尾多余空格
    }

