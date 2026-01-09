Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40110A1E
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767917380; cv=none; b=BtAw1chb9zmjXE2NOKP8QqANRYqCodpsbobC4vkeFPhTpLeT1M9Hzaf+Axfv17X0AAJDCckyflSo7XZTwBXjk2hgYSniC2XHI5OLxgX5BcblliF3NnpwaLlDhbhP/9xLP9OQr4MJ0rF+roAkUGZLuru7/TA91WCdxA4gto3XJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767917380; c=relaxed/simple;
	bh=tfrXfpFvES9XZjLIOw7ts89hAIvMyB8rFddr9wCACfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eev9JZSkBURsV74aajZIR6ADjLDduuVeByuWCJdZddy8r0/UCWBQjqEKKFRM6NQdfhWlfxuCmJCqSmHYvM8YNXPq38dIvbjgHwVive0fn7TqP4skMVpTi1lXY2VAMlJbUy9UXcOI0LIXJ4rg0UgyB7VojMKcbH63ENnzeW2MyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCPxMkmb; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCPxMkmb"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88fe44cce7eso30353716d6.3
        for <phone-devel@vger.kernel.org>; Thu, 08 Jan 2026 16:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767917377; x=1768522177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=jCPxMkmbtsYaq/v8UQrFl4h3XYCyVJlkKLXAgZpnkN8wPBfSykXRmK+sGraT+Y1tTX
         Pwvc41aLcS955ahmtIDo+gi2R3/t6a3BzjtoM8E0m+HnJZIM93/Ckt39adU7x0THTPMS
         DfB7Kt+J1twta+1DdlUGtJW1W/mlXKi0jDKmOeZum17/lCXZFOEUxnyhOEk9LssYqB+V
         Tlt5UD/PPCWVvPZ9upgv/gDUOoCLpaEGLLsmycXlimazalx55HIRr+IeDOT2gQLEfD7X
         erQGW9wyt12Vsl8+woXlrcOHmQOr8cCY+g5ITYLWMFLzFZcedb7EwKpVoi4SV2trwgbs
         vixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767917377; x=1768522177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=HXuYOJSBsDsT+o7bqxZuk+GiqzIhvWT/vkrNiwNNK1cS2Pj61tfGIic4BTXrBvZbTj
         GZhZyJxkn7aIz3OKDttj0VzHChqBo5eSkk2LwrXgIIPFp1RX8ulxvFM3JiCFZHO4IaN+
         yTIoZakHEPn0sqyyxjdP80mj6gaDowC2dpMM97tdZ7v/BoP+X8BcaoTYOmyj0rE2wBHB
         HNjmwhQPJdtISonYMRkoECAwXS1PbgwzA+wYSs91IdOvbENO05z44wl6NrlwYpzonxnv
         bwM0YEg8/nK+6LBiccTaM4qr3+HRnCep40KCnWhUuL+TQTM1fd/BxUtY4GofbhdcKWH1
         34iA==
X-Forwarded-Encrypted: i=1; AJvYcCVG8yn3dgGHEG85Hyc4io3s4i9iF/uvx2Hvx13IhuO0rn5H2jqdlfpaX3myd568CzCwVnko0rgzZhkoAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+hw0agEfaiPYJTWz89DNnD2W2Bk729umiWQg1x+4oXUCoaBV
	wYC+eNdInLRq+yF6AStbCwcoecpjpBiWRGIMEmvtLdYcf4kdl+RTb+I6
X-Gm-Gg: AY/fxX59Zh6BsDe2ESxAfWRIstRlPiY6gI0syG7BH0NcisqvGFicQFtnf0gKlkR9IVa
	AdKfM8KcEMUImuj6G1corHExAlfol4HtrMhN/DtERTcEAYq4LmuqRxNGzoZbfZ1VXCEScM77yDz
	aZuxpfkiUREBFLPLIEHh9OcNrQ8K3CRxsyUV3XAoVdoh65wC14KLZwT0mLSqeK46QYLNRg9aWnc
	WH+zFtptTRiUFnn02zCfyw0nzScLYC6PactpSClWdwHVJqSK/9PaPMgb4i/xJihS/deiRoR924n
	u7osOIluP1wGWntOKJkPDGNCS8O/u6spVEU11VN827OZYPbi0rggFL/wz7hjFeJ6QxbSfGxLEnh
	ctZVNTsOfeWsF6YXJrWFTqCMrn4s1+1r8z0NppAhLBfdf/PCzS9iNBsEqtLxcbv1z4vkFM+fIDi
	+C670rM80YmTBhFudBsRTacsai
X-Google-Smtp-Source: AGHT+IE53QNgO8H5ekocStQPoh1dkomyApC3B9GarKSN3SFKH4LWIoibjHSscmdkAjc4QCj5ErkGzw==
X-Received: by 2002:a05:6214:2347:b0:7f5:eda2:a54b with SMTP id 6a1803df08f44-890842e1b55mr117237186d6.62.1767917376936;
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234ca1sm62882266d6.36.2026.01.08.16.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Date: Thu, 8 Jan 2026 19:09:57 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aWBHVUBhPa6iZ0ib@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
 <20260107-aspiring-unselfish-dogfish-963c1e@quoll>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-aspiring-unselfish-dogfish-963c1e@quoll>

On Wed, Jan 07, 2026 at 08:35:25AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:40PM -0500, Richard Acayan wrote:
> > The IMX355 camera sensor is a camera sensor that can be found as the
> > front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> > 3a, and Pixel 3a XL. It already has a driver, but needs support for
> > device tree. Document the IMX355 to support defining it in device tree.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
(snip)
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Read carefully last sentence above.

You left some comments after tagging your Reviewed-by, so I was unsure
if this changed the tag:

- https://lore.kernel.org/r/bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org/
  "Ah, here, this obviously was not ever [compile] tested."
- https://lore.kernel.org/r/fedeaca3-5549-4d57-8f13-f0ac58d1e4d0@kernel.org/
  "why do you need data-lanes if they are fixed?"

About the data-lanes, they are unused by the driver and can be dropped
next revision.
