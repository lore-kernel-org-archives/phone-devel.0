Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEE36920F;
	Mon, 12 Jan 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235343; cv=none; b=Ee/anwpRu4Tzja3LwkneuSJO2LKDyww7ZCleFPQTQAa1cameBxMmtG+V+2WOq9yXrjfRu9CUFDWFZoxCmU+iqi5BbQAio3hlKuvVlZLyY2CsPVfeUrQXmx9KNr0shXutNxFeO/dEtjIxRnHx3dgdmH6QMXebtrOFaaHfeaOxaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235343; c=relaxed/simple;
	bh=YlCu7k+Wp5aO3LXoKIvn1JdG466yBIodD6PEhjLg/ss=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=akjKDJLc0rwVCP/ts7aLcVG6Pg9H2H+gs7ivmvw12oqngvKsFHe+h2Qo/878GgULal8WVKhz7lqu5h4hsMHbR+G7Epe0UDivNUkgPQFqhRG8R7hQz8RCOQd9Z0ix9D+Q8SNb0odTz9MYpod2tR/QHEhvvS0u1eYFuiZ5g7QTrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in; spf=pass smtp.mailfrom=machinesoul.in; dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b=IS1gC0hN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0PAptMsJ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b="IS1gC0hN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0PAptMsJ"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EDD351400150;
	Mon, 12 Jan 2026 11:28:40 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Mon, 12 Jan 2026 11:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=machinesoul.in;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1768235320; x=1768321720; bh=QCDkMBMy2ui8oxl3R/8b2JxjhGAtXl0M
	UjPheNK+Gl0=; b=IS1gC0hNFEjj4Ap3saiW/1AyyTeilvauJqhPdJMuiKRM+4uQ
	1ymheQsF7aVkBQIKIv/fE3YZNrrvKd1TaHewQ+xnJKZFBuDk9napcPm20tle8kNb
	WpAkjQVmQ5IU8UjSpMMSSvFpNC1HdVfxGMV4JcHhU2husmywXEp3dBvb4qrSZHvc
	wziH19rGGJSVrXyWLYzQkT256m5tLk43YJiC9yEgBcDoGMuWeNlR5UASl8NsDr46
	00UOzPIUWbJicH4g416dwaPC0EkkG8PhhX1mwt8YycLBoU9USdmfJwk+Xb1AP6ir
	9Zr9CYs3+YWIHL50GkLN9E2CG1VE8FBmguN+9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768235320; x=
	1768321720; bh=QCDkMBMy2ui8oxl3R/8b2JxjhGAtXl0MUjPheNK+Gl0=; b=0
	PAptMsJC2GmCAKx2xI4FECp3q4u/b9m8MpamhLQ88Vk8oorzsIeh10n0UJ0vpWYv
	M15qV/AB+z1zgziVPc2I0f9HQnqDvSUVk3tsBDvg+RhrjuJ3i+iR3BlwjNdlvrT+
	yn5/mDTZVxdL/ZcO2AZjoBLIYsW1GS35L4fY7M1d1jZbQrw6ypxYZb1vf3MihUrR
	VAIhxGmsaRny3IbDW03CVeCU6iDxLp2xnKRT3x8HYq7Osy+o2V2hcOMpj9NFEPET
	GYnICoPUXdyMZjf8SNUV99N0hiPh04FjI2BMifu6xvnUd3v46gYYmPs59dpbzuhC
	Mzy2nlpf3wsiDjU+B1Zeg==
X-ME-Sender: <xms:NyFlaYrwBTPJfSElJTj1apBOJxxZ4HnXbzZcpi-5xlioA0cn-1H03Q>
    <xme:NyFlaZc6alYE-o1MunTw231t1qzDfZtSEqcgnfC_1BjqIEtC3KpihfuoYr8m0lMSI
    cd96BCpzRl5ra-aDMeUCc6rCiTTyJ4nR7Zvd1Vs-FOOX1yEyL_Os-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejleefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NyFlacwVYsK8zgGesQ7LmXZCEHDzvwhlZaNsIIO-ZYZt4LsPh5hPCA>
    <xmx:NyFlaRMOoR-I4fMznodGpzCz4oA99JkrftFAL9yWzNDHYgxowvY81Q>
    <xmx:NyFlaeoVaXxHHpO1bZGDebwkgVZuO4Kg3zETDnDlDAOlTSTbJX-7Vg>
    <xmx:NyFlaY9aqC8BKFPZrYCw8_pQ_07VyZluaHKEaexrM1ZM0Kqkt49Teg>
    <xmx:OCFlaYK1sbb36iceZ7Oe11c2yeZB9TyUnXcp_AxS8UGHJ_JOricyzUM2>
Feedback-ID: i19fe481e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44875C4006D; Mon, 12 Jan 2026 11:28:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHXG7HT5u_Wc
Date: Mon, 12 Jan 2026 21:57:46 +0530
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
Message-Id: <19035a09-8b6b-4590-a816-82350c1389e3@app.fastmail.com>
In-Reply-To: <1ab13178-8253-4dc7-9143-6684ededd8f9@kernel.org>
References: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
 <20260111-aw88261-dvdd-v1-2-83fa0850d561@machinesoul.in>
 <9249c034-de8c-479b-a9c5-f1252e0beba2@kernel.org>
 <5e47fe91-e150-4b5d-a669-3a7beeea4f03@app.fastmail.com>
 <1ab13178-8253-4dc7-9143-6684ededd8f9@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: document dvdd-supply property for
 awinic,aw88261
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 11 Jan 2026, at 9:40 PM, Krzysztof Kozlowski wrote:
> On 11/01/2026 13:48, Bharadwaj Raju wrote:
>> On Sun, 11 Jan 2026, at 5:00 PM, Krzysztof Kozlowski wrote:
>>> Why? Was it missing? Why require it, which is an ABI break (or is not?)?
>>> Why is ABI break allowed or what is its impact?
>> 
>> Right now there are no users of aw88261 in the kernel device tree sources.
>> This patch is part of an effort to mainline the FairPhone 5, for which we 
>> will add the first use of this compatible, and there we need to specify 
>> dvdd-supply for this chip's power supply.
>
> You mean the bindings were incomplete?

Yes, the chip needs DVDD to power on.

>> 
>> Since there are no present users, I thought it was OK to add a new required 
>> property. If not, I can make it optional.
>
> Nothing like that was explained in commit msg. Also your explanation
> above does not consider out of tree users of this ABI. That's fine in
> general, but needs reason why you are doing this.

After looking at other codec drivers, they generally make it optional 
in the binding but error out from probe if it can't be enabled.

I'll resend the series with it made optional.

Regards,
Bharadwaj
