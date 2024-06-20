Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134D46525
	for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915935; cv=none; b=BQBHPfcQkrOZUqw3cYzQ8rew87Euukzsi45M7gwIRC0VXghwiWQWlHX4sqflukNfQsNQpsLk1G6JyDBHA/Sm5nKbLclDmeOPbat+2aheoCqS/ZPWgliv5auOJziSrqmLPOUAenAuQQ10apGzspanooIz6RnZElWjl1EdHoPyMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915935; c=relaxed/simple;
	bh=oGap+EuOGFC5B/6eNk2XEyAmiNddzucnVXUXSsR1hmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW7HMWkD+Y4VlUh8uZrGRlTu6OQoF1ptDPDkL0nQl1J28+mwVzK1o9KsedYYiPDXZOrI2muyn3Un2DhBaJ+R8/GjnGaCLaNgAAiTD7s0Be1mR20CJ27t86oz/k8iMpIG2seJblAVd7pK22w2eN2jaLoL376Gy3/pEX1qfjMS6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuDoqGLx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuDoqGLx"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe785b234so13683931fa.1
        for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915931; x=1719520731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njLEEuZyMxfG5FyNtjads2hMdYAWqv6cZs0xVoAuq6U=;
        b=TuDoqGLx5g6T2gGcw/SiBxukVf+ffuEn4XSmqfVx3FWCMd4/3bFUS5xQgknv2L9KK5
         z/DaMqVQ4brImS8RmgNjm9skZRQcCGIbnsmNS5Hzl9cJ9FkXVzhIl6b3vofiXJmd2uYL
         7u/cxSdp3R6SQBUAU1HDtGKxyIDGUpQ6v8JetYShJmalQEaMb2gbXN1jb2TUHk0s+fFL
         dFjo8mPyD9lfZ/3p/eaD9ygMGpG0ChiMKOCBzTvbKLmAudx4+e8QGIueXpPdhPduqCQO
         pnv0+R1l8PrDk9WUcmjAy8gP3hoh91sy4j+oNzNtgcecJ8Oh1qiK6QNyEOTatmLalKFd
         rRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915931; x=1719520731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njLEEuZyMxfG5FyNtjads2hMdYAWqv6cZs0xVoAuq6U=;
        b=EncA8sGkHT0Pbp0Ql2b2mfxdPn6WPrLOFp+NVXd24WZhwBXiJGG+l/YKkW3ol0ZkRk
         KN5U1nPkEVfSvv04Pxk8aBmBZli6v+lR/ips17eTppJXNxY+oW+N1LaPxZNmbhCJTrXm
         TJUVenZOIX9J0aGzjbhSLDs4qx2xjiNmEZhbQniKUOJ+z8YVYGVWpZ3tvUipl6qtjbNK
         2c3h/UfcJ38oOaJWxZBhwMwrygSivopWQBCnel2D8sAJH+Mw0tU7GLAVIx4vDrG8HWIv
         voQJaXseK0zdldHbbUYM8nxhW1UnDQSiL4/BgHpKQ4wBO10+Z4cxGjojC1mSiiJEmTqB
         xu1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3VxPQw49046ElDQzDBGloP5yIihITthUVMvobWQJceptSMwgPT3BVpE2K5a3kUxKRNxO4B/mNbI+CqzB00/oa8c8akix3gTCpnI8=
X-Gm-Message-State: AOJu0Yzy6T245sw++ieLwYI2muXI5LwBA+/HcqH5qXZjeN6Xba0I6N6A
	Qqt0JOMEC0G4+NiQofZJVsbxHcU1WmsGIrN0+nzljUcNxF8AlPhYDkmfpiT+ppw=
X-Google-Smtp-Source: AGHT+IGoVlJFt1tcSG+42UB1lS0RFqpVYqmcQIHJmbgcYNlgSAK09MN3gK92Kpdt1cLgQa/CDhV5Ow==
X-Received: by 2002:a2e:9241:0:b0:2ec:2a7:af46 with SMTP id 38308e7fff4ca-2ec3cffc600mr41397251fa.45.1718915931328;
        Thu, 20 Jun 2024 13:38:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d7090a3sm154351fa.46.2024.06.20.13.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:38:50 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:38:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: qcom: msm8974: Use mboxes in smsm node
Message-ID: <7irayxs62grsgimv4764ujmrgbj6fepvj3nqa2sjglcozcjasq@yv6b7rn7lyvc>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-1-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-1-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:27PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
