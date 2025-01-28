Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881B19E97F
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061766; cv=none; b=uOK/eEvdCRy0WAzHKPdizaMtedLh7Q77G8gd2lrDChOQOwbXKtjGYvHwUPzy7YvhMQwrh4QWNelhUxtPlx8COCktuxl4dUNlmsbylJSGAFFNzcgwjBhTHJfySWTZqv47qFKmjNvloSGOI95o7O4TKYoqKeXVF/Isuy3AiKCh+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061766; c=relaxed/simple;
	bh=cArZVZaLci+50MPkg01ZYsHm0mt+lKxiUKiDtQqfBEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIffk6YMPXuj27mpJeTkXH4hSXRVLlAzVhwlrc7cLfjFxrILMie5+mLUCvDkDC80D6H31lF9zK1WWy5dB822hYmUcfNoyZxE/YINwNwbYfNiyLDSmacGlnu8OIZN6uj5dRswetfPKkoGLW/vEFR3+zdfFsy+H7gDR4U5D+zhKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTogRCKf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTogRCKf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso36621465e9.0
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738061762; x=1738666562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xsh2bdBHY9NmVDqj8pBitppRTEEhQQ7ykuHHJrKgvjM=;
        b=TTogRCKfC7iUiosD0TVDE0EqQDuGZ+JQKKIUCBgvk3Kb36bqTKi4zVwWuKR6eWVE4L
         WHXV0L5+gmpBV8r9bAJ8dU5l/AQxghgjtFHXcNWRIKmSncwxKN+DTNACifWF7u0qlldK
         3pJyl0fSoLatrt+9o7gujzuxbYaFPsKxTicg3reWaEgejoMJt94ERUAWDL1w2JCSApbI
         GynVYnjIBxpA5qDv2i/rtHoethHPg3+maKuS+8dmFbL67hBCu6b9zRY5wZiXbuj58Zk7
         ohaPmtXerBYRmK5FhHifkLZ35o0pZgfBmsYyYAxsoqzUpRj6zEwWOaUJLpsWNp+pF34y
         /kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061762; x=1738666562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xsh2bdBHY9NmVDqj8pBitppRTEEhQQ7ykuHHJrKgvjM=;
        b=bAbDIiEsmT9kFs3dhSvm4T13sU9wM77Q637/fioe3/NmJOq+DkkQNPsXWUgVEPBbIx
         hGTsICOx8280+NwVBKgiw+wQLYT+fHeniA8QKc9DH/PLgsowrzUkazxUMi1TJoPIKg9K
         LE5d2gpd5/yTpHpvd/sRKBvk8bFN4SbnWBE6SNiWDsq4ciwiQzysaWmODvCSczQR2rpb
         Ao4dJ4T5jkSPyTNe2UTn3jUJKaDAh7uOWKVnLvhXlFRcgHSIIpvGV0uhXIN9mV7q6Ckf
         IAU6b6t87Uc57tM1HtZchl1wR5JMCqbXTEvnstKSOHCD3MDkPASCzuGzOaikOhuOmRSO
         H5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsNawKPmI+/tzojQzFvQLt+ZQzsaflPY7cwiZRTz69SFgEJXIfZsNyEP6Q/xyhzR3U2y61CUROf4oQQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFyXkzcCuaZanUITLYT/LAU/eLhLkOfhPr7Sf1gbN0wT3uejAE
	UteH9pUbtT+Xm6gWrBwakTyLjfbgUu98VujVS4oCuJXaUZhIX8BwOvFh8Lqw0dQ=
X-Gm-Gg: ASbGnctf62nZJobkua9TAs4VSnUNAw2s1A2yFC0QcLBaJu5yIwRqXpXoVbBhDNcKl/z
	ITdGVpkMgJ5KU2Eg/dztKr8M7IGhvAqpn0ZrvTEG2L7h8+qWBrch/SSXAQaLA/3s8VX7mAcDz6/
	zxSB1YyoLua1xSb+V/JtxlJFNUK7Xvogf465mgMhY2XewWgH7wAkELLAN8vKsXElHj+54pgPOLd
	mTxkaSimptO1opAm5mGwdQBXiiubVG2NbuD/JKXXncoQtUAwAUp1JA4j78lzRR8OWl8lE9OZenB
	E45JN2X1M/4wiz+2J1TYCWe0YSI=
X-Google-Smtp-Source: AGHT+IFFfd66YWcV3wlAUFzLoGU3ZbpAAot76mCsg4WzevFEyoKcFSJu+ml7EishK6BP/p1tw+IBNg==
X-Received: by 2002:a05:600c:348f:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-438913d693bmr486492905e9.11.1738061761800;
        Tue, 28 Jan 2025 02:56:01 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176538sm13555756f8f.8.2025.01.28.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:56:01 -0800 (PST)
Date: Tue, 28 Jan 2025 11:55:56 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms
 with one power domain
Message-ID: <Z5i3vMYnxBNb31yr@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
 <5b0f9cd4-df65-4963-8d6d-5bdf759ba0c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b0f9cd4-df65-4963-8d6d-5bdf759ba0c5@oss.qualcomm.com>

On Tue, Jan 28, 2025 at 11:45:51AM +0100, Konrad Dybcio wrote:
> On 27.01.2025 11:45 PM, Luca Weiss wrote:
> > For example MSM8974 has mx voltage rail exposed as regulator and only cx
> > voltage rail is exposed as power domain. This power domain (cx) is
> > attached internally in power domain and cannot be attached in this driver.
> > 
> > Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> > Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
> >  	while (pd_names[num_pds])
> >  		num_pds++;
> >  
> > +	/* Handle single power domain */
> > +	if (num_pds == 1 && dev->pm_domain) {
> > +		devs[0] = dev;
> > +		pm_runtime_enable(dev);
> 
> This call can fail
> 

It returns void though? :D

void pm_runtime_enable(struct device *dev);

Stephan
