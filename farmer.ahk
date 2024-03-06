#Requires AutoHotkey v2.0

$[::ToggleFarmingMode(false)
~$S:: {
	Panic()
	Return
}

$]::CloseApp()

; VARIABLES
farmingMode := false

; FUNCTIONS
ToggleFarmingMode(panic) {
	global farmingMode
	farmingMode := !farmingMode
	if (panic) {
		farmingMode := false
	}
	LockMouseInput(farmingMode)
	WalkForward(farmingMode)
	HoldLMB(farmingMode)
}

Panic() {
	ToggleFarmingMode(true)
}

HoldLMB(enabled) {
	if (enabled) {
		Sleep(Random(25, 100))
		Send "{LButton down}"
	} else {
		Sleep(Random(25, 100))
		Send "{LButton up}"
	}
}

WalkForward(enabled) {
	if (enabled) {
		Sleep(Random(25, 100))
		Send "{W down}"
	} else {
		Sleep(Random(25, 100))
		Send "{W up}"
	}
}

LockMouseInput(lock) {
	BlockInput(lock ? "MouseMove" : "MouseMoveOff")
}

CloseApp() {
	ToggleFarmingMode(true)
    ExitApp()
}

