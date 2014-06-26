from alsa import Mixer

m = Mixer()

PVOL, PSW, CVOL, CSW, ENUM = m.set_playback_volume, m.set_playback_switch, m.set_capture_volume, m.set_capture_switch, m.set_enum_item

controls = [
(PVOL, "Headphone"),
(PSW, "Headphone Playback ZC"),
(PVOL, "Speaker"),
(PSW, "Speaker Playback ZC"),
(PVOL, "Bass"), (CVOL, "Bass"),
(ENUM, "Bass Boost"),
(ENUM, "Bass Filter"),
(PVOL, "Treble"), (CVOL, "Treble"),
(ENUM, "Treble Cut-off"),
(PVOL, "PCM"), (CVOL, "PCM"),
(PVOL, "Sidetone"), (CVOL, "Sidetone"),
(ENUM, "Line Left Mux"),
(ENUM, "Line Mixer"),
(ENUM, "Line Mono Mux"),
(ENUM, "Line Right Mux"),
(ENUM, "Mic Selection Mux"),
(ENUM, "Mic Sidetone Mux"),
(CVOL, "Mic1"),
(CVOL, "Mic2"),
(PVOL, "Mono"),
(ENUM, "Mono 2 Mux"),
(PVOL, "Mono Bypass"),					
(PSW, "Mono Mixer Bypass"),
(PSW, "Mono Mixer Left"),
(PSW, "Mono Mixer Right"),
(PSW, "Mono Mixer Sidetone"),
(PSW, "Mono Mixer Voice"),
(PSW, "Mono Playback ZC"),
(PVOL, "Mono Sidetone"),
(PVOL, "Mono Voice"),
(PSW, "Playback 6dB Attenuate"),
(CSW, "Playback Mixer Left"),
(PSW, "Playback Mixer Right"),
(PSW, "Playback Mixer Voice"),
(ENUM, "Playback Mono Mix"),
(ENUM, "Playback Phase"),
(CVOL, "Capture"), (CSW, "Capture"),
(PSW, "Capture 6dB Attenuate"),
(PSW, "Capture Filter"),
(ENUM, "Capture Filter Cut-off"),
(ENUM, "Capture Filter Select"),
(ENUM, "Capture Left Mixer"),
(ENUM, "Capture Left Mux"),
(ENUM, "Capture Right Mixer"),
(ENUM, "Capture Right Mux"),
(PSW, "Capture ZC"),
(PVOL, "3D"), (PSW, "3D"), (CVOL, "3D"),
(ENUM, "3D Function"),
(ENUM, "3D Lower Cut-off"),
(ENUM, "3D Upper Cut-off"),
(CVOL, "ADC"),
(ENUM, "ADC Data Select"),
(PVOL, "ALC Capture Attack Time"), (CVOL, "ALC Capture Attack Time"),
(PVOL, "ALC Capture Decay Time"), (CVOL, "ALC Capture Decay Time"),
(ENUM, "ALC Capture Function"),
(PVOL, "ALC Capture Hold Time"), (CVOL, "ALC Capture Hold Time"),
(PVOL, "ALC Capture Max"), (CVOL, "ALC Capture Max"),
(PSW, "ALC Capture NG"),
(PVOL, "ALC Capture NG Threshold"), (CVOL, "ALC Capture NG Threshold"),
(ENUM, "ALC Capture NG Type"),
(PVOL, "ALC Capture Target"), (CVOL, "ALC Capture Target"),
(PSW, "ALC Capture ZC"),
(CSW, "ALC Mixer Line"),
(CSW, "ALC Mixer Mic1"),
(CSW, "ALC Mixer Mic2"),
(CSW, "ALC Mixer Rx"),
(PSW, "Amp Spk"),
(PVOL, "Bypass"),
(ENUM, "DAI Mode"),
(ENUM, "De-emphasis"),
(PSW, "GSM Line In"),
(PSW, "GSM Line Out"),
(PSW, "Handset Mic"),
(PSW, "Handset Spk"),
(PSW, "Headset Mic"),
(PSW, "Left Mixer Bypass"),
(PSW, "Left Mixer Left"),
(PSW, "Left Mixer Sidetone"),
(PSW, "Left Mixer Voice"),
(ENUM, "Out3 Mux"),
(ENUM, "Out4 Mux"),
(ENUM, "ROUT2 Phase"),
(PSW, "Right Mixer Bypass"),
(PSW, "Right Mixer Right"),
(PSW, "Right Mixer Sidetone"),
(PSW, "Right Mixer Voice"),
(PVOL, "Voice"),
(CVOL, "Voice Sidetone")
]

def restore_defaults():
	for control in controls:
		func, elem = control
		func(elem, 0)

restore_defaults()

def load_stereoout():
	PVOL("Headphone", 0.9)
	PVOL("PCM", 1.0)
	PSW("Amp Spk", True)
	PSW("Left Mixer Left", True)
	PSW("Right Mixer Right", True)
	PSW("Stereo Out", True)

#load_stereoout()

def load_handsetout():
	PVOL("Headphone", 0.9)
	PVOL("PCM", 1.0)
	PSW("Left Mixer Left", True)
	PSW("Right Mixer Right", True)
	PSW("Stereo Out", True)

load_stereoout()

