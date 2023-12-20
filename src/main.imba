global css 
	body 
		c:teal7 
		ff:Georgia 
		inset:0 
		d: vtc
		bgc: #f5f5f5
		fs: 1.2em
	button
		w: 100%
		c: white
		bgc: teal7
		border: none
		p: 10px
		fs: 14px
		rd: 5px
	button@disabled
		bgc: gray
		cursor:not-allowed
	input
		bd: none
		c: gray9
		bgc: inherit
		fs: 1.2em
		ff: Georgia 
	input@focus
		ol: none

def rndInt(min, max)
	min + Math.ceil(Math.random() * (max - min))

let num1 = rndInt(1,10)
let num2 = rndInt(1,10)

let signinInfo = {
	email: "",
	password: ""
	userans: ""
	correctans: 0
	ansIsCorrect: false
}

signinInfo.correctans = num1 + num2;


def checkAns
	if signinInfo.userans
		let checkansval = 
			signinInfo.correctans === parseInt(signinInfo.userans, 10)
		signinInfo.ansIsCorrect = checkansval
	else
		signinInfo.ansIsCorrect = false

tag inputbox
	prop inputType
	prop labeltxt
	prop placeholder
	prop idval
	prop inFocus = false
	labelcolor = "gray5"
	bbc = "gray5"
	bbw = 1
	
	def showlabel()
		if data == ""
			return false
		else
			return true

	def triggerOnFocus(evt) 
		placeholder = ""
		inFocus = true
		bbw = 2
		bbc = "teal7"
		labelcolor = "teal7"

	def triggerOnBlur(evt) 
		console.log("val:", evt.target.value)
		inFocus = false
		if evt.target.value == ""
			placeholder = labeltxt
		labelcolor = "gray5"
		bbw = 1
		bbc = "gray5"
		console.log({signinInfo})


	def render
		<self>
			<p>
				if showlabel! or inFocus
					<label[fs: 0.8em c:{labelcolor} o@off:0] ease htmlFor=idval> 
						labeltxt
				<br>
				<input[pt:0.5em pb:0.5em fs:1em bdb: solid {bbw}px {bbc}] 
						id=idval
						type=inputType 
						size="50" 
						placeholder=placeholder 
						@focus=triggerOnFocus 
						@blur=triggerOnBlur 
						bind=data>


tag signin-btn
	ansCorrect = signinInfo.ansIsCorrect
	css
		button@focus
			ol: none
	<self>
		<button 
			disabled=!(signinInfo.ansIsCorrect)
			@click=console.log(signinInfo.ansIsCorrect)
			>
			"SUBMIT"


tag app

	<self>
		<div[w:100% 
		mt: 2em 
		bxs:xl
		p: 20px]>
			<p[fs: 1.5em mb: 1em]>
				"Sign In"

			<inputbox[mb: 1.5em] bind=signinInfo.email 
			placeholder="Email" 
			labeltxt="Email" 
			idval="email"
			inputType="text">

			<inputbox[mb: 1.5em] bind=signinInfo.password 
			placeholder="Password" 
			labeltxt="Password" 
			idval="password"
			inputType="password">

			<inputbox[mb: 1.5em] bind=signinInfo.userans
			placeholder="What is {num1} + {num2}?" 
			labeltxt="What is {num1} + {num2}?" 
			idval="userans"
			@keyup=checkAns
			inputType="text">

			<signin-btn>

imba.mount do
	<app>
