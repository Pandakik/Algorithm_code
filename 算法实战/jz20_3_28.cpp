bool isNumber(string s) {
        int n = s.size();
        int index = 0;
        bool hasDot = false, hasE = false, hasOp = false, hasNum = false;
        while (index < n && s[index] == ' ') ++index;   //ȥ����ʼ����Ч�ո�
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
                case ' ':goto next1;            //�������ո�������ѭ��
                default:return false;
            }
        next:
            ++index;
        }
    next1:
        while (index < n && s[index] == ' ') ++index;
        return hasNum && index == n;        //���indexδԽ�����ʾswitch�б������Ŀո񲢷����ַ����Ľ�β����ո�
    }

