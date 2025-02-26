Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82518CBFB
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 06:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740549637; cv=none; b=GzqYqb8ILNlnl73en2Wceq4f/+741lZgfJypMkej1MYlPmcOvCkUnCM80RZhCBnGS/t0Nll230UK8hevyBYr3AAS7M0hN5VSy+6MddvEjtyUU9OGxA2NSDEG5xty0CLkfbSvspyBNGML01xPM5U3AAA9LfyKeDOHBPsHKOCO95A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740549637; c=relaxed/simple;
	bh=QJvs8FXWeaOfq2m4P6J0WZ5ujUFqp1HQJvlwASUdwDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESqqMX+fEjh+MmToslW/1SCepp5X3ecj4zvzAYm8/zuPH4a14ty1IVrivDxDqlC7kT/h0yq4jeL5Mhew+fzrc4vyGOcnTPge+4YRwAT/Y1oXC72M+1RWPtmqGqQSmdqax+rAAWx3gvsS9/YCkw+1uGFrf5lRYbK9A4Ffuyk2Kwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3LlAIgE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3LlAIgE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so59796481fa.1
        for <phone-devel@vger.kernel.org>; Tue, 25 Feb 2025 22:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740549634; x=1741154434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
        b=p3LlAIgEvS+YQeglnDfIIlLNKF7COpzGftiNMzrRm8/S0uuWTEnFyWP0mlSHT4e/uv
         C83Cs5KXGuQAfHpUAeV65oKPT/T7ZZk/dhKD7DBQXt7KRTVUbFkr3bETG/94aRC2DIi5
         lyWQodAMf9LSizqbEZFpynXUD3c14TeyrWYpIFSfYdVAfBC3c2VonXOJTNgYx83Sa8Oy
         a6hD1WiKNbAdU+P1cBcngE97pQ4xOwxH6NAkAOr9hoz521RNb61aLzQNHUAEdhaQ74Z6
         rPGT+Dv/M9rkoLCQTGhDCj2PdGKWkpr7+0ntCDRKG0Zx+v7Zb8DjKOT/4BnFozdmZDPN
         3uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740549634; x=1741154434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
        b=eebtlzKZjtTNEh42d92v2i/JLGcGFcJ4qiGLc6gRxEv+SVEl9GIf+1/WxzUiGxASDT
         LHtoeCjULUbWcmTA2RSl/PKL8dcv1Oi+RkKWGTsqU9MKg9oqvAmnxWh393qXWd6nTuFL
         7RCvlFxASETC6FopwGvFiGmUsWdkbIHIqso+dfrhhoGkB9ghTQAdQzsAMR6JPENlKVvk
         2LTo0PicEobc7Dybd8SLGfMT/PaomYbVm9llAhC97tFmLz40zieZd3Lr6F58j3ElDGj2
         dq1j2V9ilFwr9bWFBnbn/l5CmfuqpMfkoVkZk0EfklT7HP5ppc7bgkJs55Dh92/IPbop
         vkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrqIJ3p6lFW/wNpdcRnGiYgFiZK8x1xh0Pp0yj7yoYjZ0KSUhh21ppjjldlI8MiiTFKXVPzcSlaQRGFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zxLtyPcPBqs6JIs2o7DlxcEOueYgcZfnbbiLtGrzsWsFDJOo
	+HLxUH0S3Z4Tw4Zmk37h/r4YfsQBwgnoplMEfk/p+oxRFVmxzidO1iRL/Ie/eGg=
X-Gm-Gg: ASbGncs1cPe08AvMwmztnHLRIIdJJLSOwR12phxoH+iWapzFzWMjnyrmPwbSBj/Y3nk
	CpSYAh4PFLRKcMSP+OL6DS4Df27m/6TXkwW9r8D3ZoazXqiwDKSVda04UM/KBEMYuFQT4CQi5Z5
	Cv6zIH+HHY3FOknKRSqKikdMXDU/1QStKGzs+bVsyp3GFmwC5tspk6nmiXXemdP6sJy+ZVQ9P16
	RHM242/ULl14R7vYdW5pTLp8UAFSqQ5Ddhd4xZWJ0uWTW7LisR+Y7zHswRCOo3dU3perUolzMT+
	CbEVCdw+yL7W7jeiOOKUEEljFglbd3p6NUuB10KN68tFlYSUOUKRKiONHTJPfc5Emy0u4orBMjQ
	D2IqLIQ==
X-Google-Smtp-Source: AGHT+IG8CWS6G0bTARrClr5YZ5iAJEIALey0T04/2PiGrwpS70hRtWkWD+U3cdrkKaDh1s5/wDX5Bg==
X-Received: by 2002:a2e:914f:0:b0:308:eb34:1012 with SMTP id 38308e7fff4ca-30a599702fdmr79176461fa.30.1740549633801;
        Tue, 25 Feb 2025 22:00:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819f5b2esm4247241fa.64.2025.02.25.22.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 22:00:32 -0800 (PST)
Date: Wed, 26 Feb 2025 08:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
Message-ID: <wohqhsuu35m2ghd7a5xgsy7ktxvqn5id7nuzox536dyllczobc@vxyzse2wrlwu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>

On Tue, Feb 25, 2025 at 10:14:32PM +0100, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
