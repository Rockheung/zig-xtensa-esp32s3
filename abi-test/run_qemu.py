import glob,os,subprocess,sys,time
flash=sys.argv[1]; out=sys.argv[2]
q=glob.glob(os.path.expanduser('~/.espressif/tools/qemu-xtensa/*/qemu/bin/qemu-system-xtensa'))[0]
p=subprocess.Popen([q,'-nographic','-machine','esp32s3','-drive',f'file={flash},if=mtd,format=raw','-serial','mon:stdio'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
buf=b'';t=time.time()
os.set_blocking(p.stdout.fileno(),False)
while time.time()-t<120:
    try: d=p.stdout.read(65536)
    except BlockingIOError: d=None
    if d: buf+=d
    else: time.sleep(0.1)
    if b'ABI DONE' in buf: break
p.terminate(); p.wait()
open(out,'wb').write(buf)
l=[x for x in buf.decode(errors='replace').splitlines() if x.startswith('ABI ')]
print(f"lines={len(l)}"); print([x for x in l if 'DONE' in x])
