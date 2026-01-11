Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA53BB44;
	Sun, 11 Jan 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135795; cv=none; b=egmeVKSRGmbMF5UPe0MxRJV7/lCvhanaryU84r8KbHJJYtKy4JZHdlhPL7JzQGwi0nmQYXbtTWhIk4Sg/4Codz2SuOYcWfmYEZQ+CRRdSRytYD3gDDfKpzrtVamMVMOHjaube8bpTBgmh57PvSM9++QDOJtqsaSVUYHb8uR0kIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135795; c=relaxed/simple;
	bh=80VrWFxklQiC2GuGjPFXtOITn+vfYoXKApuzbVmx/BQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Mn0E9SqQfvGLPJxFtNikVXRL/AN11ZYhoMOohd+LVln+mMInfmPtqaphYn1S91/hH0G1ENuI8SBMlYjydXo7UC4/RB1ec5CTsYcg7QEBS/Qm4cehpM1BDzC78lba6cSJFb2DAMuhEAU3Bs0UtbGHKx9uVBEVvO5Ayzh8m6kF9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in; spf=pass smtp.mailfrom=machinesoul.in; dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b=eTL7bh8c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SDdcRvWT; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b="eTL7bh8c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SDdcRvWT"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 927C11D00117;
	Sun, 11 Jan 2026 07:49:52 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Sun, 11 Jan 2026 07:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=machinesoul.in;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1768135792; x=1768222192; bh=o054WpN5HcmGcr752nHkWih9TAp94o4B
	t7F3jynb8eU=; b=eTL7bh8clphpxMQaKEYNKNritrtdYLtEKofJSKC8Ys0swuih
	6BMgzdOFHiJFq5xacHdNs5h1yvvah0HeKveOz/MA7GuM+Q4l8/NiOchPC7W+CR5y
	sDFFzi177J/ERwcL/sWP3AxDcLSsW4Bn8ngUsVQsohW1r7n0AR0hqGn3qdmnT1pm
	2LRpoZcq+E9PrE3lJ88bhZpuQfohjBitd4ktMhTXsaFRoc7afN9S1rCz3J9EJW11
	5xPT1c9l00V+Xs/Iab2VwtAPuEb18YVDG/eH+wX1WK2Sk2WhIRBGTJIXJJYHdtan
	mZngEBaqV+eXddCAlV2b9RQLW34zugtFh1QJwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768135792; x=
	1768222192; bh=o054WpN5HcmGcr752nHkWih9TAp94o4Bt7F3jynb8eU=; b=S
	DdcRvWTUYV4ZPQekbw/WkyzKrg4zl/vH1uVDLfDTKUaQolFKp5JHZ9NAKb/H+oe7
	C8gJTwesA+gYg+FMNRFCI1z529esPPCFthe/dI58Yai0uWIBv483efwb4f2O0zyL
	Io0Qi72jpkOSJ2N2fj0xIlvhn3vP7vyKXhI7EJY7oYfOeT3ftj7lp5B2i3/de7W8
	kHoYtIDr68EhjCl2H6kvN1A3imZiY1ki2Vw76+mhAjyfLCv1MG16U9LeYbPDbQwi
	iiEFF/oA9xsHjIi2xuJ4jmTm66fUgQfxRG3HAp/FFoWmcmGcKvXFCj995x1wOY6R
	Y9qb9wWJ04XpaGSaw6Phw==
X-ME-Sender: <xms:b5xjafSBdu1mjJXC6A8_N228a-thZsXfgPCb4GLoUC2XZ9n5iaoMxw>
    <xme:b5xjablgtdT5wlDNakH7rP7TdeNrNTl-ND-5Yz-oGGEpd0u29EdVd3CKPyHXjKR3s
    SAGa2GS6k-Ku1lcxUBmgwO2RB70tXuaEdoqPwBAAWJdhOT0xVtuYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfuehhrghr
    rggufigrjhcutfgrjhhufdcuoegshhgrrhgrugifrghjrdhrrghjuhesmhgrtghhihhnvg
    hsohhulhdrihhnqeenucggtffrrghtthgvrhhnpeefteefieetuddvgeetgfehteeitdek
    gefhleejjeffgfeiueevleeuheeigfffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegshhgrrhgrugifrghjrdhrrghjuhesmhgrtghhihhn
    vghsohhulhdrihhnpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepfigrnhhgfigvihguohhnghdrrgesrgifihhnihgtrdgtohhmpdhrtghp
    thhtoheplhhutggrrdifvghishhssehfrghirhhphhhonhgvrdgtohhmpdhrtghpthhtoh
    eplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgv
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepmihpohhsthhmrghrkhgvthhoshdsuhhpshhtrhgvrghm
    ihhngheslhhishhtshdrshhrrdhhth
X-ME-Proxy: <xmx:b5xjaRbSpkEwHgaBPK4p2q_ElXwt1mUe6QuLsqQqeLtHl-ZDfTV5AA>
    <xmx:b5xjaZW1R9HAs-Q9HXfgZdLn2kLNL7CcmmAOQxmc32W5YdmlFI5s_g>
    <xmx:b5xjaUQ0tQLYi8xrG7QdhBKUqQXjjqsAWVjo-PtGXeRLcG0zWFDrqA>
    <xmx:b5xjaeEiTsinPNSiF2dIuMPkl78iJofSMav5zWZO3lT4B5kruOex7Q>
    <xmx:cJxjafS20QMwlsZDiJ3heS_Al9ll3JZQl5d4t-YSkUJ0IcLqKrBMQTf3>
Feedback-ID: i19fe481e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46C01C4006D; Sun, 11 Jan 2026 07:49:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHXG7HT5u_Wc
Date: Sun, 11 Jan 2026 18:18:55 +0530
From: "Bharadwaj Raju" <bharadwaj.raju@machinesoul.in>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Weidong Wang" <wangweidong.a@awinic.com>
Cc: "Bhushan Shah" <bhushan.shah@machinesoul.in>,
 "Luca Weiss" <luca.weiss@fairphone.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <5e47fe91-e150-4b5d-a669-3a7beeea4f03@app.fastmail.com>
In-Reply-To: <9249c034-de8c-479b-a9c5-f1252e0beba2@kernel.org>
References: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
 <20260111-aw88261-dvdd-v1-2-83fa0850d561@machinesoul.in>
 <9249c034-de8c-479b-a9c5-f1252e0beba2@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: document dvdd-supply property for
 awinic,aw88261
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 11 Jan 2026, at 5:00 PM, Krzysztof Kozlowski wrote:
> Why? Was it missing? Why require it, which is an ABI break (or is not?)?
> Why is ABI break allowed or what is its impact?

Right now there are no users of aw88261 in the kernel device tree sources.
This patch is part of an effort to mainline the FairPhone 5, for which we 
will add the first use of this compatible, and there we need to specify 
dvdd-supply for this chip's power supply.

Since there are no present users, I thought it was OK to add a new required 
property. If not, I can make it optional.
