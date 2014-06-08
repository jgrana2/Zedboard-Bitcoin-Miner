import bitcoinrpc
import sys
from bitcoinrpc.exceptions import InsufficientFunds
print('Getting data...')
conn = bitcoinrpc.connect_to_remote('user', 'password', host='localhost', port=8332)
work = conn.getwork()
data = work.data
midstate = work.midstate
target = work.target
midword0 = midstate[0:8]
midword1 = midstate[8:16]
midword2 = midstate[16:24]
midword3 = midstate[24:32]
midword4 = midstate[32:40]
midword5 = midstate[40:48]
midword6 = midstate[48:56]
midword7 = midstate[56:64]
midword0sw = "".join(map(str.__add__, midword0[-2::-2] ,midword0[-1::-2]))
midword1sw = "".join(map(str.__add__, midword1[-2::-2] ,midword1[-1::-2]))
midword2sw = "".join(map(str.__add__, midword2[-2::-2] ,midword2[-1::-2]))
midword3sw = "".join(map(str.__add__, midword3[-2::-2] ,midword3[-1::-2]))
midword4sw = "".join(map(str.__add__, midword4[-2::-2] ,midword4[-1::-2]))
midword5sw = "".join(map(str.__add__, midword5[-2::-2] ,midword5[-1::-2]))
midword6sw = "".join(map(str.__add__, midword6[-2::-2] ,midword6[-1::-2]))
midword7sw = "".join(map(str.__add__, midword7[-2::-2] ,midword7[-1::-2]))
midstatesw = midword0sw + midword1sw + midword2sw + midword3sw + midword4sw + midword5sw + midword6sw + midword7sw
targetword0 = target[0:8]
targetword1 = target[8:16]
targetword2 = target[16:24]
targetword3 = target[24:32]
targetword4 = target[32:40]
targetword5 = target[40:48]
targetword6 = target[48:56]
targetword7 = target[56:64]
targetword0sw = "".join(map(str.__add__, targetword0[-2::-2] ,targetword0[-1::-2]))
targetword1sw = "".join(map(str.__add__, targetword1[-2::-2] ,targetword1[-1::-2]))
targetword2sw = "".join(map(str.__add__, targetword2[-2::-2] ,targetword2[-1::-2]))
targetword3sw = "".join(map(str.__add__, targetword3[-2::-2] ,targetword3[-1::-2]))
targetword4sw = "".join(map(str.__add__, targetword4[-2::-2] ,targetword4[-1::-2]))
targetword5sw = "".join(map(str.__add__, targetword5[-2::-2] ,targetword5[-1::-2]))
targetword6sw = "".join(map(str.__add__, targetword6[-2::-2] ,targetword6[-1::-2]))
targetword7sw = "".join(map(str.__add__, targetword7[-2::-2] ,targetword7[-1::-2]))
targetsw = targetword7sw + targetword6sw + targetword5sw + targetword4sw + targetword3sw + targetword2sw + targetword1sw + targetword0sw

#Example data = '000000020597ba1f0cd423b2a3abb0259a54ee5f783077a4ad45fb6200000218000000008348d1339e6797e2b15e9a3f2fb7da08768e99f02727e4227e02903e43a42b31511553101a051f3c00000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000080020000'
word0 = data[0:8]
word1 = data[8:16]
word2 = data[16:24]
word3 = data[24:32]
word4 = data[32:40]
word5 = data[40:48]
word6 = data[48:56]
word7 = data[56:64]
word8 = data[64:72]
word9 = data[72:80]
word10 = data[80:88]
word11 = data[88:96]
word12 = data[96:104]
word13 = data[104:112]
word14 = data[112:120]
word15 = data[120:128]
word16 = data[128:136]
word17 = data[136:144]
word18 = data[144:152]
word19 = data[152:160]
word20 = data[160:168]
word21 = data[168:176]
word22 = data[176:184]
word23 = data[184:192]
word24 = data[192:200]
word25 = data[200:208]
word26 = data[208:216]
word27 = data[216:224]
word28 = data[224:232]
word29 = data[232:240]
word30 = data[240:248]
word31 = data[248:256]
word0sw = "".join(map(str.__add__, word0[-2::-2] ,word0[-1::-2]))
word1sw = "".join(map(str.__add__, word1[-2::-2] ,word1[-1::-2]))
word2sw = "".join(map(str.__add__, word2[-2::-2] ,word2[-1::-2]))
word3sw = "".join(map(str.__add__, word3[-2::-2] ,word3[-1::-2]))
word4sw = "".join(map(str.__add__, word4[-2::-2] ,word4[-1::-2]))
word5sw = "".join(map(str.__add__, word5[-2::-2] ,word5[-1::-2]))
word6sw = "".join(map(str.__add__, word6[-2::-2] ,word6[-1::-2]))
word7sw = "".join(map(str.__add__, word7[-2::-2] ,word7[-1::-2]))
word8sw = "".join(map(str.__add__, word8[-2::-2] ,word8[-1::-2]))
word9sw = "".join(map(str.__add__, word9[-2::-2] ,word9[-1::-2]))
word10sw = "".join(map(str.__add__, word10[-2::-2] ,word10[-1::-2]))
word11sw = "".join(map(str.__add__, word11[-2::-2] ,word11[-1::-2]))
word12sw = "".join(map(str.__add__, word12[-2::-2] ,word12[-1::-2]))
word13sw = "".join(map(str.__add__, word13[-2::-2] ,word13[-1::-2]))
word14sw = "".join(map(str.__add__, word14[-2::-2] ,word14[-1::-2]))
word15sw = "".join(map(str.__add__, word15[-2::-2] ,word15[-1::-2]))
word16sw = "".join(map(str.__add__, word16[-2::-2] ,word16[-1::-2]))
word17sw = "".join(map(str.__add__, word17[-2::-2] ,word17[-1::-2]))
word18sw = "".join(map(str.__add__, word18[-2::-2] ,word18[-1::-2]))
word19sw = "".join(map(str.__add__, word19[-2::-2] ,word19[-1::-2]))
word20sw = "".join(map(str.__add__, word20[-2::-2] ,word20[-1::-2]))
word21sw = "".join(map(str.__add__, word21[-2::-2] ,word21[-1::-2]))
word22sw = "".join(map(str.__add__, word22[-2::-2] ,word22[-1::-2]))
word23sw = "".join(map(str.__add__, word23[-2::-2] ,word23[-1::-2]))
word24sw = "".join(map(str.__add__, word24[-2::-2] ,word24[-1::-2]))
word25sw = "".join(map(str.__add__, word25[-2::-2] ,word25[-1::-2]))
word26sw = "".join(map(str.__add__, word26[-2::-2] ,word26[-1::-2]))
word27sw = "".join(map(str.__add__, word27[-2::-2] ,word27[-1::-2]))
word28sw = "".join(map(str.__add__, word28[-2::-2] ,word28[-1::-2]))
word29sw = "".join(map(str.__add__, word29[-2::-2] ,word29[-1::-2]))
word30sw = "".join(map(str.__add__, word30[-2::-2] ,word30[-1::-2]))
word31sw = "".join(map(str.__add__, word31[-2::-2] ,word31[-1::-2]))
swappeddata = word0sw + word1sw + word2sw + word3sw + word4sw + word5sw + word6sw + word7sw + word8sw + word9sw + word10sw + word11sw + word12sw + word13sw + word14sw + word15sw + word16sw + word17sw + word18sw + word19sw + word20sw + word21sw + word22sw + word23sw + word24sw + word25sw + word26sw + word27sw + word28sw + word29sw + word30sw + word31sw
choppedoffdata = swappeddata[0:160]
Version = swappeddata[0:8]
hashPrevBlock = swappeddata[8:72]
hashMerkleRoot = swappeddata[72:136]
Time = swappeddata[136:144]
Bits = swappeddata[144:152]
Nonce = swappeddata[152:160]
firsthalf = swappeddata[0:128]
secondhalf = swappeddata[128:256]
print('Block header information:')
print('')
print('Version:',Version)
print('hashPrevBlock:',hashPrevBlock)
print('hashMerkleRoot:',hashMerkleRoot)
print('Time:',Time)
print('Bits:',Bits)
print('Nonce:',Nonce)
print('')
print('Midstate:',midstatesw)
print('')
print('firsthalf:',firsthalf)
print('')
print('secondhalf:',secondhalf)
print('')
print('data:',choppedoffdata)
print('')
print('Target:',targetsw)
print('')
import serial
print('Starting serial')

ser = serial.Serial(
    port='COM3',\
    baudrate=115200,\
    parity=serial.PARITY_NONE,\
    stopbits=serial.STOPBITS_ONE,\
    bytesize=serial.EIGHTBITS,\
    timeout=10)
print("Connected to: " + ser.portstr)
ser.flushInput()
print("Chars waiting in buffer after flush: " + str(ser.inWaiting()))
print(ser.readline())
ser.write(secondhalf[0:8].encode())
ser.write(b'\n')
ser.write(secondhalf[8:16].encode())
ser.write(b'\n')
ser.write(secondhalf[16:24].encode())
ser.write(b'\n')
print(ser.readline())
print(ser.readline())
print(ser.readline())
ser.write(midstatesw[0:8].encode())
ser.write(b'\n')
ser.write(midstatesw[8:16].encode())
ser.write(b'\n')
ser.write(midstatesw[16:24].encode())
ser.write(b'\n')
ser.write(midstatesw[24:32].encode())
ser.write(b'\n')
ser.write(midstatesw[32:40].encode())
ser.write(b'\n')
ser.write(midstatesw[40:48].encode())
ser.write(b'\n')
ser.write(midstatesw[48:56].encode())
ser.write(b'\n')
ser.write(midstatesw[56:64].encode())
ser.write(b'\n')
print(ser.readline())
print(ser.readline())
ser.write(targetsw[0:8].encode())
ser.write(b'\n')
ser.write(targetsw[8:16].encode())
ser.write(b'\n')
ser.write(targetsw[16:24].encode())
ser.write(b'\n')
ser.write(targetsw[24:32].encode())
ser.write(b'\n')
ser.write(targetsw[32:40].encode())
ser.write(b'\n')
ser.write(targetsw[40:48].encode())
ser.write(b'\n')
ser.write(targetsw[48:56].encode())
ser.write(b'\n')
ser.write(targetsw[56:64].encode())
ser.write(b'\n')
print(ser.readline())
print(ser.readline())
print(ser.readline())
done = 0
while(done == 0):
	line = ser.readline()
	if  line != b'':
		print(line)
print('End')