Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5123ED5F
	for <phone-devel@vger.kernel.org>; Tue, 25 Feb 2025 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453452; cv=none; b=JuHsvagCEpWdEReD5OGLwD9+c9bGwdeOHI2JgapSjX0lHQPUNeD29Znsmd+4KU4YddOmRuombyo5MaWkmZnhZCQ6GlP48vPwLdPIGnsYy4S2k3ZEkwTOJYuoHuBX1jYNGKl+oGahnDk06uGJQ3LNaMGd6OVk9XKhf27JjQuI3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453452; c=relaxed/simple;
	bh=xdMJFduuFVdDfRcYXmcf+iepoeRKpVZBuh6VAxiDRjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmeaatQWzo9ALmgG62jtojFjmwH+MCQZmLxCMDCYeXCJjD43ZZ9tLFk8uJb9molkiUQzJj9x69WpkTI/nN69Q1o8qFXB4KZgqcs3Jh2RvDtJuo7Y/78bbm9htRn2AmbfCnnbUhG2kPV7lduvs459mTS50KvmQQLqh7fcItP+NJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOtDDi6y; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOtDDi6y"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so22886081fa.3
        for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 19:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740453449; x=1741058249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErwZgVdj5p6xF2muLcoQXQqaXweqPuzZ5KXiqDnh9+o=;
        b=fOtDDi6ymek7vh1moImKKs11EnM2p7whvl8I55xKpBuyyTCKOtx7c/XCa7b4vI8AGA
         jMy4/Trhqi8vNbUcCIOgClzHFlCpEQshizFuAx5Vi5KKRgF60cO0h8VI68J8MkVFCqs1
         Y5a4KPEoTAMjoMuQu1ZgsdvrZKFYAUWrQ6hPecP+KjVWyo7TsyZC8+ojtO6gi8v83wEl
         /TFOa4CW00tzTQ7FhSu5eTUhqqHvxJVrGIuau8R3GR4FMjbTpovijbYOIigccgNAH7Ep
         c/1BCqVOP2BTu9wKt3j/APpjzQAEJM5JFnVXX2msJkNA+9ECT/QdlCR70wK7/DROv1C6
         lgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453449; x=1741058249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErwZgVdj5p6xF2muLcoQXQqaXweqPuzZ5KXiqDnh9+o=;
        b=U3v+h5wlhsvsYYYOucqjdqZXYkDSz1RS3PNLODVoJ1z2Lkg3BBBs15XDNWBI090DWP
         8y0nx50Zj467PH032UC6xDWNRNIv9vqJTCE17q+RnhwhGshwZ2zMRAeqAAtvUCl2KI4h
         AS6eAAsg/GaJ6sk8Tu95iXiY8dstQJWKhkoO20BOP87NG2QwrOszWiLOwlW0ZeUq36vG
         8Ta8KGJeP00eKlmcQsJGVqv/0FIJ5CrGT7+zlYPi5G3XLzZfPXxaE91WnemB++zq5Ao3
         4KLc4NqKFWeDA0vds1kQlsLaTJbo6GNJ1ZpHCpaUqm3RGAAOpYwP8Mnw3JPJh2QtcQdU
         TA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPZhEVBsXVPfcC5uleBe1QmVwLvZ0UjwOpzNwR607nvFAE2lEQYTRdIKhC43shdASx60AjIJA6BjQULA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JvNOt5gmuinBD5dnN7g56GZpR2+720cZHvl1vh1RDwa29aRX
	FUg5pE4SBblOlekpbl8J9Z2SOr/UhOuWkGUCAJlnfb65tIkxBV5tm5Sz2+Y6fCE=
X-Gm-Gg: ASbGncvOKvdW7R03s8iFnhiAkcXeJEqV/BW00H/+paSLbFDyxXWA1fG4FsIX8yyjWha
	t837NcXWp3VI9rdUw1FhAT6P0q7m7ViRhUwYY09CKrB1/fZHo9j9/CBPvvTcUlk9Boe79xFo7H+
	YAfdu2dTx+PT93nbmDCRI6Z4fHXwdaASxog8s77CFOg+RLgwS95jBnZxhmCKV4LEWM6XrQWWXXf
	q7aenVbL1KI/4ctf+Z1pDyEHkNeT+xUD6nLpoaaX3B36RwiQ5VuVnPMvrvOdO8exN+tXzkyz4of
	mTFWUyt+A4Pj0SwuW4w0PMnsNghrnktko1NmSnZCloXeIMzKZ3IzUZz7JEUyQcaN7l/owU8ICxL
	qCGyeZQ==
X-Google-Smtp-Source: AGHT+IGNyDqvJxVxqP5uUjlG9LFxo0ubNdF4Qj+xzKe0poWIckWW0gNZNqJemNsdxd4SujSyFUqBGQ==
X-Received: by 2002:a05:6512:3dab:b0:545:285e:7777 with SMTP id 2adb3069b0e04-54838f4cc88mr6329025e87.39.1740453448575;
        Mon, 24 Feb 2025 19:17:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b78dfsm62244e87.54.2025.02.24.19.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:17:27 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
Message-ID: <6pqjzeb6xxozxmfeowmxz7pa2hldiet4mibllpsvtqheijjxl3@j7xsmlbtjfxb>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
 <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
 <6d1a95a1-0b84-4bc5-9cb0-3cc514d292a6@oss.qualcomm.com>
 <82a9d623-2033-4d7f-93b8-67007b46be79@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82a9d623-2033-4d7f-93b8-67007b46be79@lucaweiss.eu>

On Mon, Feb 24, 2025 at 09:43:48PM +0100, Luca Weiss wrote:
> On 24-02-2025 9:27 p.m., Konrad Dybcio wrote:
> > On 24.02.2025 1:17 AM, Dmitry Baryshkov wrote:
> > > On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
> > > > Set the paths where the device-specific firmware can be found for this
> > > > device.
> > > > 
> > > > Fairphone 3 was shipped with secure-boot off so any testkey-signed
> > > > firmware is accepted.
> > > > 
> > > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
> > > >   1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > @@ -82,6 +82,8 @@ nfc@28 {
> > > >   };
> > > >   &lpass {
> > > > +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
> > > 
> > > If any firmware is okay, wouldn't it be better to use
> > > "qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
> > > I'm a dreamer), then FB3 can pick it up.
> > 
> > No, the fw may have board/wiring differences encoded inside it
> 
> Second that, while I don't have access to the AMSS sources for this device,
> I'm sure there's at least some board-specific config in these images, and
> I'd rather not boot up some ADSP or modem firmware compiled for some
> Dragonboard or equivalent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
