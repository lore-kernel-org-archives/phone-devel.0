Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D914A4FC
	for <phone-devel@vger.kernel.org>; Fri, 28 Jun 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563588; cv=none; b=CEf0UdVXPpzIYXbYNPBTifIm591Wj/nf+dtJvitWouddIgyKl+Aj2Me2NGH+PAUPOkEHfALH2QnIQ4uNpuxcOvGLuwz5N+dZiQzh0X8sr7Kkaz0SlnqqgLQDFfGttlthn/N6rKWtPjV0QKlfK2y4iREmBwxs426b3wlT7duoOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563588; c=relaxed/simple;
	bh=5mm20Y/D18e3rhH9q0DzVBFAuRhcMRyS+8NV59qBtfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RStdtd16doHhDAA0sZb9OLEKORIJLwZ3Ha2nwmkq1qKqh7gkRPzasskYJFlAd0dTRdaLD+uZldg8AlE+r2WS375Z0WBq0kXwn2nkPmO2hjQQj0UPyJl5MiQWirfvuM3rl1WHVlz4YdoK4uqPFIvsZxSE16FBzh5u7bWy6IWObcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=el0C4bR3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="el0C4bR3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so3466541fa.3
        for <phone-devel@vger.kernel.org>; Fri, 28 Jun 2024 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563585; x=1720168385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks4ZsEAD+yVsd8GiSq5R6Kq/PRusoPcTcDCgKL0huZk=;
        b=el0C4bR3/CEJpJ1LED3ows3RlFnrtt6t0W+S6WbSj6RZtcekCQd79nqwML9U0UQv8R
         RuxTIBTYS/HL5hfnfhKkZhDVukGcPY/5x3yx+5Qwyj5U8TJQRaErg6KDe8UNMEBFur3G
         USMmeXYPKDLl0l/YcYCnT9JfPrTemWH8DHvtKTGjghnwd+vAwC7wDTyuScJOZdk8N8uH
         zWHqQQYtmheyRsw3mU6m6+2Juy/oRPAYJyqly0uEL6OkgdAQRp2i1G2oLtsDXCjRgbRB
         gOyxtPyp4ZIc0R45tt2xjZ6vkBnPNKpswIK87SjSX8yHdnnB90yvT1inyWfuwufB4CxC
         QpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563585; x=1720168385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks4ZsEAD+yVsd8GiSq5R6Kq/PRusoPcTcDCgKL0huZk=;
        b=RrSIKJbw7aOyn4Ez9VkkbLVc+OwxZreQlVq4T83uCVaaqS3lL9Uf7Q3Y1086err4TZ
         wdvNhs5UoFrueE1DzRX/cXLlL0N62WSd+qG36Ix/yyzKY1SzWw6g8xhm9VrA5vpDGAMW
         IRCkp+bZBybcE7u0VVLFUQBO6XzHF2fn8G5c3Jwu8woIrJj6gfj/0RmQDFGWsK4HUCDl
         1OD2dHCUpJBEur9G9h0sLZQ82zTgjL+LlD//29GKJ2S3wXWz8FzkrFoRTvYQeaYhxc7T
         LevjrPjweDPHtEgV3bfmLxJ8NT01F2aY2oFl/WlSYLIBhO3HeYKRnhCMuoKe00PKfgCt
         kX1A==
X-Forwarded-Encrypted: i=1; AJvYcCUPIGs7yK1pQ5534avNLIXDTFE2JoD4VanArbQp0qhC0Noy1Fq5KcJmaw8WmPS8GEf8JF+EkgTB/R/4OdRaoGgcKsKrdxXsIzH2Om0=
X-Gm-Message-State: AOJu0Ywkt/VyY3SowLlmXQotwt2X0z1tLekSzGtY/HT5dX6IUIhUVlab
	a57N3aIkbLLloXWKpFWPQs+2AXFA+o2WOUQXRlwIGf4VS5ZTco425d5p0EIzeQw=
X-Google-Smtp-Source: AGHT+IGeWkgVfKjAulIjwjOJ7JAplKw19Fhr4yFgcepcShFgKVVaoXv9nId96W32Ts8FIc7Tk2NB2g==
X-Received: by 2002:a2e:780a:0:b0:2eb:df39:232b with SMTP id 38308e7fff4ca-2ec5b27ed94mr97569761fa.20.1719563585517;
        Fri, 28 Jun 2024 01:33:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168c70bsm2063861fa.104.2024.06.28.01.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:33:05 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:33:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Name the
 regulators
Message-ID: <jzwiyrswop6yy3rprndxcyalikgww3i6v34wb3g73xj2kyl2pm@7coycikxmyud>
References: <20240627-fp4-regulator-name-v1-1-66931111a006@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-fp4-regulator-name-v1-1-66931111a006@fairphone.com>

On Thu, Jun 27, 2024 at 03:15:54PM GMT, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
