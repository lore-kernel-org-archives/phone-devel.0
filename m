Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA16348477
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549717; cv=none; b=BJM2XJSumkQPxWn33uad6eQYXhcPThv1jeALGnKdrU2kB6TiWnjygqvKKPyqbxqa/jkJODrxl23FVF2NdRUeODUaDAegyjp2Zz/7IgcBXHYEwfPNJnjisGAHzuqFEnuZJU7kLrKRL8bXM+rf3O+OSCgpNT0MijTutcom01ekoPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549717; c=relaxed/simple;
	bh=Jc3WGM9+nSXAgx36gi73IUpaDeFuSOdmq7+OowChnuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVSepnw5vwwE91+K2TcTVX2FEVpYv4wFh420GI8JSQdYSGkIevU4ud5zNjdMoNkKZ84qT2nFqameE6UlQiZE1CjCa/s4kL/DsIbTJyc44KPfrKCc+eHfYylYnuzHViOUW++YCSWmOkNrwRy6uWlEKjE7ZTo0aOuqSYyP7CweSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng8H+v2f; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng8H+v2f"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so818616a91.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549715; x=1775154515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=Ng8H+v2f2gb72FkTKL926Ur2LpFCywyblJxHiipmgBBoesWnFT9mK4JGhYLTFG+Gms
         CfY5M4yzKUScXweA9XyaI21nEB79fAFAgDRMbj6gMLA1sMWVRWBcSbmF4vyFm+pg6FTA
         okINvyZaUY5KdplTpCBaiPJhSW6cmDLzAgkoZxuJ1lXkOuwnVBYqxexny/0HhKkvEXaL
         L0jDS1WkN7jAHkjegdotknB8wEO9OLsP55Aibjwb0qORUDXWd3ZdTGp+PECnuCuClWmC
         kC7nUEyNcLXur79YXFvSJj6h8kFLoHXfFihbkjPGsq/ZJukbimctau5N50qkhz5kw2+S
         gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549715; x=1775154515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=FedacKbcYeJZ92E0QFqGSrsxyGHuWT4eEVkLqajHwiXO/DgtL3Wp4bKg6N39gwLEoh
         MqYZ/MfL5k+V9E/0Vr3ff282/4QchEB8JpxvCLk5+QjoVFOPmIXDyd3i6qD+Mezb6wgD
         vYa0Y4xVSOHZAeS9co6nc4PGf5ja81X3j56XlIImB8Lr4w+meCnXpUiNZfMGUdePfckc
         QR01bJhYKBEpAUbq2oKMEwgg0DV1bnLM/7MoJ0D9XIu29ZKonJpNXlQf9EJ7ED/lglHJ
         i7fg+JSvk388EPj833/6A8wH3J3tBVNHosynCCCi+ndD2H0DmLKy+SLDeCZNNbog0ADs
         zb2w==
X-Forwarded-Encrypted: i=1; AJvYcCXw2EplISsax6T48SsW1TQIsOqn8qsl1/HRqYSewg3kA+FCZRx/YOQjdZwHueQKnNqaZHJeyDOozWdb0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dwlQ4byUaVe8QQ8KtsV6+n3Ai9OAqkPzxO8qczakkg0VX7V4
	GyHYJHmVEHGp81AVYyw7Pgilvi4g8Lct8teTfCDaVVXSYx4GvybttMRi
X-Gm-Gg: ATEYQzzlbs1xkkySSPxGQJEZd1E3fzOhXplXvbN58cf+wRPW39CI9Mh0Y2LLMSrYM/H
	QOQMSrlEFcU/jEHip4g4TOa+mVWWeYL9Mr3s+ghMrlcu1dp98ASICMhK5psyzgKS5aBM4pq58b2
	4sy9xdjLxmJUQafsxLQt3tFwdeIhr4U/KfxO5ZnE1k6LOGBC2BjPyz0JeeWhyOdsv4djUui64oK
	WORfJjsxG8bYj0G9UwQZPMprQwklZ7YMk8hDv4ogrNqzTyez7oasOnP8cf8jlfP5Z/PG4ySuuBW
	RxdlpR9GYni8ijgiYhcbi2qqZvvm/px7ya8iI4rPdcv+sPUoNleJVvb/abei3Wuo6e+HLggia8q
	eSdzCbiUMVLZHu3w8Wy7HzZ98XxgoGWgVlF/oBIi3+Q5dqCg79v1PZ0610+ejh2x6PatDYE+/Xe
	wGTjRyYOiHvEDXnlttYwvTTTbzUFq5gx0=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35c0dc813dcmr8363731a91.7.1774549715010;
        Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc795f08sm47816045ad.21.2026.03.26.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:28:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Date: Thu, 26 Mar 2026 18:28:19 +0000
Message-ID: <20260326182821.8332-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching.
> > Also, remove dr_mode to enable OTG capability.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> I'm not sure what this is going to do for other 6125 devices
> that don't have the Type-C infra wired up.. Does just applying
> this commit alone keep peripheral mode working on your phone?
> 
> Konrad
> 

Yes, I have verified that USB peripheral mode is working with this
patch only by using USB network[1].

[1]: https://wiki.postmarketos.org/wiki/USB_Network

