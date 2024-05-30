Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332F3FB88
	for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088564; cv=none; b=AbFGjVJEn20YMA22aENTPbZ3+D8O4S9ctXLCCP2blifhKSP7tBUwIKgcN04biKwoBf51Bs8D6qfFHU++d59lydUU+KBKbQyPOfL5x30HCShrMuVJdXWQ6670BAPGW90BvE5GDQcHQNloQmdKgtSh8RXh1/qQr5+utdmCCqdWMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088564; c=relaxed/simple;
	bh=NdeAZFb/TEcSPW596tqV59n63pD22xeumxgqmJWgrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGxkaYLF+QQeIVfSt5ZbrF/xyx5Y5+5CV0gE+KJZxh9KVxR1CebBkiD8oYi26weTJCm4HnMyskI9aKbczToCF81dtmOascBQ8rTOJ9UwSabSwav8XdMAdt3BBQE5oBpS2DH1Nwm20z5s6eJaxtnKBK5TXT4tNTdhXzIRVx8tqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/U5QU7Y; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/U5QU7Y"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b83225088so409583e87.3
        for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088561; x=1717693361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXYZN/m1C6PG6AKOiFq8myIP4DlpPrlE9EpwRqlB3rc=;
        b=I/U5QU7YBRAFFV1+xlZ4rHsPBF1WB5JG7G7PQ95yyFbphN6K/3HJ+cZE//1cRogBL5
         fGvhWxzSuXwoxA4eVBAau0Bh0JQG2554EmZBkroYkDFFCA7iTUcmnRRyUlRiewww/zVi
         kjrgTeTxAsed5DJjJQb8xpIePlE7eJ/Wn07CVP9Tvb0L2AoaRFnb6PxCD3jJapOjZlcm
         1dhqEHPAbH3/jntx0BfNUHIZipuWs4lHZKMy020r1eBacLvDLDW0+el/9A5k4HbQjBGt
         Oir76rXgC3DoqkFs0Ygy90lP+f3o2fDeZLynK12RNXBmIKHOPSrwEC4nonq1YAgWFv4h
         SzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088561; x=1717693361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXYZN/m1C6PG6AKOiFq8myIP4DlpPrlE9EpwRqlB3rc=;
        b=lZWfsgOeRAdlSIU0N46Jw+qkEjro/lHaG5pDAEQBVX3h3dWSZM0QxStreZ4pCFDfJt
         x00Sx80cH84UXfubjKhkLV4tn2YfHRo3Xk9mNG1DTkjsWt6zHezizh+82BNbeLQNTfum
         3vwbVXzUmbA11cMGMTk6C2dfMV+hn5FG9gO/QlQAlzwSz6yXwnQNnz1+FelfQNH/2WCv
         9m4kiU8Go1jIDwDCilgxxXF9TXTENsUphvYi2SRROhVgDRAOz42FDdcyy4w2nOEpNvSt
         Ug85poJoRiHvuUnHQQuTkBzBaw0Vhc6vZR4CzWWJK5zTlq/cvI6Oi8KD7/AAS8paIjNV
         JPvg==
X-Forwarded-Encrypted: i=1; AJvYcCW5bwauHieqa6I0X9gobSq89B2hNOxcEf0LlLXRszeiCWYYJpMAfxpE0cJciIl2Cf/lE7tmS6oacBdAfHi3SUCOYCv4DI5d46mSFgw=
X-Gm-Message-State: AOJu0YxT9T5mq2++kYU1gsgWKjMthOnFzoj4ymPR4Z8IkppP6XH9Pr9P
	QTFLTR3MPNMHoIo5UshEL4tlM4INNxu44FQA7RGWNVjNAFM2LZgUfDfyb2IEvEi4BSZVrV8f15o
	p
X-Google-Smtp-Source: AGHT+IGfsP4JlJIU3M/U8H0MbKgZB3+fSFpnjQllEv3/kyjSgbEmTlO5kxEjkv7SgLcb/drvXLwjlQ==
X-Received: by 2002:ac2:5594:0:b0:52a:1987:baf7 with SMTP id 2adb3069b0e04-52b7d428977mr1743551e87.26.1717088560648;
        Thu, 30 May 2024 10:02:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8e413sm14912e87.285.2024.05.30.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:02:40 -0700 (PDT)
Date: Thu, 30 May 2024 20:02:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 USB role switching
Message-ID: <p2k7fyqew7u72yjv64cvbzacpgh2sf2lexb3heuvls65wu7whf@34bcxd7jbqna>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
 <20240530-fp4-tcpm-v3-3-612d4bbd5e09@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-fp4-tcpm-v3-3-612d4bbd5e09@fairphone.com>

On Thu, May 30, 2024 at 05:05:49PM +0200, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> For now USB Power Delivery properties are skipped / disabled, so that
> the (presumably) bootloader-configured charger doesn't get messed with

From my understanding the no-pd, typec-power-opmode disable
PD negotiation over the USB-C. If a device gets connected to the power
supply, it will still negotiate something like 5V / 1.5A.

> and we can charge the phone with at least some amount of power.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 50 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 58 +++++++++++++++++++++-
>  3 files changed, 108 insertions(+), 1 deletion(-)
> 

Usually the SoC changes come in a separate patch, but I won't insist on
that.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
