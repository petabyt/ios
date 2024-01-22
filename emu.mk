USERNAME := daniel
FOLDER := Untitled.app
TARGET := 192.168.1.12
PORT := 2222
DEVICE_UUID := D71A8615-AEE3-4BC2-8656-11189187C11D

emu:
	zip -r x.zip Untitled.app
	sshpass -p "$(PASSWORD)" scp -P $(PORT) x.zip $(USERNAME)@$(TARGET):/Users/$(USERNAME)
	sshpass -p "$(PASSWORD)" ssh $(USERNAME)@$(TARGET) -p $(PORT) "rm -rf Untitled.app && unzip x.zip && xcrun simctl install $(UUID) Untitled.app && xcrun simctl launch D71A8615-AEE3-4BC2-8656-11189187C11D com.cameronpalmer.Untitled"

start:
	open -a simulator
	xcrun simctl list devices
