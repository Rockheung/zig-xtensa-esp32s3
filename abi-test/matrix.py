import re,sys,collections
res={}
for l in open(sys.argv[1],errors='replace'):
    m=re.match(r'ABI (c->z|z->c) (\S+) (first|odd|late|ret)\s+(PASS|FAIL|CRASH)',l)
    if m: res[(m.group(2),m.group(1),m.group(3))]=m.group(4)
types=[];[types.append(k[0]) for k in res if k[0] not in types]
sym={'PASS':'.','FAIL':'F','CRASH':'X',None:'?'}
print(f"{'type':6s} | c->z: first odd late ret | z->c: first odd late ret")
for t in types:
    row=[]
    for d in ('c->z','z->c'):
        row.append('  '.join(sym[res.get((t,d,v))] .center(5) for v in ('first','odd','late','ret')))
    print(f"{t:6s} |       {row[0]}  |       {row[1]}")
tot=collections.Counter(res.values());print(dict(tot))
