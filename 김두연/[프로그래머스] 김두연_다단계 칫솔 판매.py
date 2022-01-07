def solution(enroll, referral, seller, amount):
    answer = dict()
    parent = dict()

    for i in range(len(referral)):
        parent[enroll[i]] = referral[i]
        answer[enroll[i]] = 0

    for i in range(len(seller)):
        fee = amount[i] * 100
        refer = parent[seller[i]]
        distribute = fee // 10
        myfee = fee - distribute
        answer[seller[i]] = answer[seller[i]] + myfee

        while refer != '-':
            fee = distribute
            distribute = fee // 10
            myfee = fee - distribute
            answer[refer] = answer[refer] + myfee
            if distribute == 0:
                break
            refer = parent[refer]

    return [answer[k] for k in enroll]