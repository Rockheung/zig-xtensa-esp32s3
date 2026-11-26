import glob,serial,sys,time
out=sys.argv[1]
for _ in range(100):
    g=glob.glob('/dev/cu.usbmodem*')
    if g:
        try:
            s=serial.Serial();s.port=g[0];s.baudrate=115200;s.timeout=0.2;s.dtr=False;s.rts=False;s.open();break
        except Exception: pass
    time.sleep(0.3)
o=b'';t=time.time()
while time.time()-t<600:
    o+=s.read(65536)
    if b'ABI DONE' in o:
        time.sleep(0.5);o+=s.read(65536);break
open(out,'wb').write(o)
l=[x for x in o.decode(errors='replace').splitlines() if x.startswith('ABI ')]
print(len(l),[x for x in l if 'DONE' in x] or o.decode(errors='replace')[-800:])
