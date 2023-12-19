global css 
	body 
		c:teal7 
		ff:Georgia 
		inset:0 
		d: vtc
		bgc: #f5f5f5
		fs: 1.2em

css
	input
		bd: none
		c: gray9
		bgc: inherit
		fs: 20px
		ff: Georgia 
	input@focus
		ol: none



let signinInfo = {
	email: "",
	password: ""
}


tag inputbox
	prop inputType
	prop labeltxt
	prop placeholder
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
					<label[fs: 0.8em c:{labelcolor} o@off:0] ease htmlFor=labeltxt> 
						labeltxt
				<br>
				<input[pt:0.5em pb:0.5em fs:1em bdb: solid {bbw}px {bbc}] 
						id=labeltxt.toLowerCase() 
						type=inputType 
						size="50" 
						placeholder=placeholder 
						@focus=triggerOnFocus 
						@blur=triggerOnBlur 
						bind=data>



tag signin-btn
	css
		button@focus
			ol: none
	<self>
		<button[
			w: 100%
			c: white
			bgc: teal7
			border: none
			p: 10px
			fs: 14px
			rd: 5px
			]>
			"SUBMIT"


tag app
	<self>
		<div[w:100% 
		mt: 2em 
		bxs:xl
		p: 20px]>
			<p[fs: 1.5em mb: 2em]>
				"Sign In"

			<inputbox[mb: 2em] bind=signinInfo.email 
			placeholder="Email" 
			labeltxt="Email" 
			inputType="text">

			<inputbox[mb: 1.5em] bind=signinInfo.password 
			placeholder="Password" 
			labeltxt="Password" 
			inputType="password">

			<signin-btn>

imba.mount do
	<app>
