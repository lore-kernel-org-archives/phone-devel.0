Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236B20126A
	for <phone-devel@vger.kernel.org>; Thu, 24 Jul 2025 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753339568; cv=none; b=f97O+/KxIGg7COgCnHue8kQ8FIbr23nH1Iwegbj6BCfU1LP9EtAcUObQc1dQFj3HtPw3P2U7EA9MCNgc/WbCV97T6uE1maGhWBBSE+IcwFQ0tiPFb/YVSXtk6jZxYaQyksNnJvLD7cYiEQ0zeUhjwfN6frUniFOvtP7EmII3cAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753339568; c=relaxed/simple;
	bh=E8K92WFLqixwgt8J2cex/loEksjjno4gWYC7Q3w7a8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G6cfLn7SixiFuCeGw2yvnbcCnZHI8QZv1EWW9XHNAElQvbNv/27FoAzYaE1tRCtWLiEdzhQWsskkBXDPhCCzvxe8qGGhhagexqET2RSa6oH8r6b8QwXlZE/sUVj9d+1moaN++Pv959d1MjSpqnaxQbLVH+BqDJtuuisTmxglpgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a797IIi8; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a797IIi8"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ae36e88a5daso114336466b.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753339565; x=1753944365; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O05wjEScA4kxCQO8+MTTv2LGUA2bVFgF29zptnElwW8=;
        b=a797IIi8N3j5cNCflbBeedwgZ+4BEGPc8ZuLFQqDrJpHsBvRjT7it5c6GWTTCe6M9+
         CSeoAAh9CsyUGQwpEemgRnaA0BuWG9r0VVnrsvVqwqi5T+hHGRgt0h62ZkelpnWRibIP
         WQastMIl/Mpmb1JH9gdkd2P1QCkoyn6/RXW2BKs6vY6QF5ayAxsFTtF+P8RWbXWx/tWa
         iwkncC9uhXG2BKuomXFXO5O0T2Pbg1ZM7gHA32+pC4h80xtWIl5Y74XCCBAZLfKVtusi
         L/V7vA01Lb10Lr4yurpoBKIZ2QUkE5C9cp8ga8+wAWi/W0VHoECKVjJMa3rMkVuISVxp
         0xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753339565; x=1753944365;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O05wjEScA4kxCQO8+MTTv2LGUA2bVFgF29zptnElwW8=;
        b=hmEKqVlhymuAZ/PfV6SlzBD2dq8IgLVQFCijvV9rI19GrOZqkJsEvDMgPwf1xoNC8f
         qbH2Mi9TPfkvL/Kg5PKFieV1Gq+KTyOhjcVT3r/5XnU0vEElksiCkZB+wqLYMstzaVz5
         cnzBjpzgK5+335zu/Dv78nZmn7Ek2LEVjaA+XnhOx/Aubnf8ikcfxN4Sr2qQr1rf4xff
         XxcsLScVCy+FbzPaEdIPEAuhk3IlALpwLkPqWDjaEPFYewtzR/jFk1/ENzOLOF/rzOuY
         LzxUgKtEbW1tifmtxzkOyYpKnmlgsWgm8LAgZGoTpPjvNJZYpMPTLbtKxgQLLzo19kIw
         nt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGuNuit0hRWe2rM7oqpxPcPevvbwA8QLfxTO0TJV7g3xIMCmRSBLMc7jei0MBx8E2fP0nzEmZn20pqxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsydHfZMVMl+PhfeL1Cpl7D8uPQgKs1ypkGfV5P+0JvCMVLVuB
	r/wX4cSsOg4ph9h8vBRVlREay9+47f5F7fZJuT7/GhTUJ/Nv+S8juWi1yKe4YmjZYwI=
X-Gm-Gg: ASbGncuolaRrAbBC/hkbp7yUFmNzfZ0EJfdckCAwJvxXLSuGfNEtGv2HGiad9upxA6x
	ld/43tRIXkBvdgQo+nzkSxbvTsINNQu0TK00L7/eEBt1P7e2Eg5iH/foh/ZEbqVQ28AEaPXkBxl
	YAe4BG38XL7hRQ6CSGwUj3wkmkVbZ+tXu9CFXYJBSXkfgwtB9bQEYZx7RAzIEvlCBIEbzTpFGCn
	RkbQq4+Ux7Is6vs3HXQD/tVZ2ikhvndFuR9+GpDB6jJg+9dkOctOXB1oSsJERU3ArUPd9Pqv1BW
	IBOj9ElAQgFzm5fT2CWyE1/RiPnmFcqvLUjiONsSpqVZO+1tDhIWaDJqGQGnjqTgccfsdAH1HYd
	pIZNnCLSoAAI1PGJuXD5k4Myd9K/8tSlaNhlcw8hDipAU7Tc6r0Ri2Thyl0fnAFFZ33RGiMvPB1
	3M7g==
X-Google-Smtp-Source: AGHT+IHOJhHzF3e38nSkhr/JtaCTAW1NS3tTTx4AD/Gh7AcSikLRvVdo/lBTRPnndwMlCRIqVf21aw==
X-Received: by 2002:a17:906:f585:b0:ae9:bf1c:50a4 with SMTP id a640c23a62f3a-af2f866213bmr566893066b.36.1753339564518;
        Wed, 23 Jul 2025 23:46:04 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42cc4sm63770166b.139.2025.07.23.23.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 23:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 08:46:03 +0200
Message-Id: <DBK303WXZ3OB.8SX718AMMYH8@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Wesley
 Cheng" <quic_wcheng@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
 <175328933413.84720.17376811405962157319.b4-ty@kernel.org>
In-Reply-To: <175328933413.84720.17376811405962157319.b4-ty@kernel.org>

On Wed Jul 23, 2025 at 6:48 PM CEST, Mark Brown wrote:
> On Wed, 23 Jul 2025 16:03:37 +0200, Luca Weiss wrote:
>> Updated description for v3:
>> Add the missing bits for the sound subsystem to enable USB audio
>> offloading on the Fairphone 4. This is mostly sndcard enablement now.
>>=20
>>=20
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/3] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
>       commit: b102c9d89fecd72be83eaab9b384285e2d0dc940
> [2/3] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
>       commit: d664e75317e19bb79b6d207f7729e35eca504a6a
> [3/3] ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
>       commit: c58c35ef6ae62e36927f506a5afc66610b7261d9

Thanks, appreciate it!

Regards
Luca

>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark

