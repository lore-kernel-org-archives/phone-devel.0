Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1623ED5F
	for <phone-devel@vger.kernel.org>; Tue, 25 Feb 2025 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453467; cv=none; b=QAtIlwzzajDZ8aO37FYRWoVnOlj03vn1EivmfoszAcNzpim3WkqK2buz5jzX0ow7O9GKXeadyN2ymml1IbR0bgl57LqHW5saJYfdM/Hja/B+vCCcXbUilwePnxQJjk4ueCain7b73hd6N5hNN2mOeL+6eR1CJ/53JoSi9AHgSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453467; c=relaxed/simple;
	bh=tbCy+DgoiEqp7P0KYIuTrwCALW4WbEtXM2gHBfT/4WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgkWLP/4WvbJUKEFPqAHYquGkV7RGYRlyqLriUGBIIXKd5y0TnPgCiNNGe7LSckVLNovaBtfm3gLgVreaJhavv1qRAy8VFWTCrYQcE0Gck+w6zCgJ38/b0cMjGl46k/bGzFXdS96/baNYTzJLR6UZPPR1z3c+cuwtAUmz9woZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sH69G2Vd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sH69G2Vd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5461a485a72so4958472e87.0
        for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 19:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740453463; x=1741058263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8Rx6B8ENt8mk1zd17zD1gzF1s2RlMqc2vCUueRva0w=;
        b=sH69G2VdlqLiGIFCFR3nAQ+um7Pz52pf5q3zAYcHfmf8s4vu6+T0ATnUwLXIX7lsYd
         jjl/itK4fIxqlfAaT7QeZSNpF7++5qGmFgLyVm16byAmmKvFJjJsfp9is3KkkUuBSY4b
         awJyHpLXzDhDIXIfrtMnBRm2m/gWPeb4ssx80sX5RJfVCUJbNqjTYnLqo9IRJJxQjAuz
         uLibC6AoDxu8XT9nlnqz5wCIWE3AZSPsGu6jsLI4NeHZzziEVvWiSc70HBucHh4af3Kg
         jKE9N9qTkkjbFSRQ4LT9V3neQ9lh1bDpzRh9EygiSpwLIl6I0Ga0W9a2NvbqAPtWLS4o
         deLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453463; x=1741058263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8Rx6B8ENt8mk1zd17zD1gzF1s2RlMqc2vCUueRva0w=;
        b=hk3hTA+e7itdU7bmOMLKckKuZPx0K+gLUb5HUwIwdkfq77gUWQFiylcTAo6Ogk/cDf
         yiwV06dU3tepH1y/crU0JHYf+bED8R2ek8iouQVWWxssahk6/AZCwC7UiLekzzt6HQPr
         w79FvXl7hP55vzdCdHFwntcZpByg+3kU0699I5qcEUcKOnln+QhRercidgnrZos10xhQ
         NJyrn2EH0GnnbT89luZ64j+1bgM/Eq8YjMtri32/PJybcE51mZSinnpR7Lca+sr2H3CS
         2FE/8sYm0SQa/XJpQ3SPe6F/R3mbxenmjBBsu7IAiTOfjeN0KT70IwkA3We2OOtu2cVk
         aeUw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ji+IemcwfdN/22mYZEbKwES9V4iW4Z9rhMoVdGRA85dBdImPgD1w7CRJx80qWgWfiahhKRU+PoHaPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZH1jxoeKFnCgr8r6v7xJXrq1hUAiYK5627ReBd1cfIeQGa88d
	n91dVl9FofebZdqLUF1mbXR7h+uaoLW6jCqcho/w4Fsj1Ii7RfFA6JYstp+sPcc=
X-Gm-Gg: ASbGncsC25VDPN9K0Gp4/cOid1pMR9IXAJ5e0GBvVi8hpxqw7qGG5s+El/0uR3ab9rG
	meLmJXfsvqL7jAhjVaBNU1k0hxn3ErPwaRnhQoO9HXtLzlYirImqQFK/3O5eknWgwFwo9IM5bMc
	qlWPF5AcoRxvBKE9wmNXEjL+KwuuQfR1H5lFHcpwQkKghBZsYYGxUFHoLvqBCAn3UGJS32ySF6Q
	wuc3VOMK7osvK3dSbxtodWITlZtC8DfpgbIMCos9B1fgBhFMkFBWXG/1K3TNTdu4bVLqFZowu2d
	/Uf0BwWbDr2i4oT5MlxnLNTT3C+Mu0rGHQIGkxKz890sL5Ol3YQAw0kHN8ASptL78JkREd6iKY0
	eFTalmA==
X-Google-Smtp-Source: AGHT+IFC1G+Qt1OfzDp64XzP6VaS1qBh0uBCplEpmO2VczKHd5eRQaq8KvOqpCDlmmDiv/XhQqWkzg==
X-Received: by 2002:a05:6512:108f:b0:545:27af:f2e4 with SMTP id 2adb3069b0e04-54838ee8c9fmr6726358e87.18.1740453463391;
        Mon, 24 Feb 2025 19:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b25d0sm62961e87.32.2025.02.24.19.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:17:41 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
Message-ID: <osoaqtrqtm3s4lksqmlsimyjsbcgozfo7gzjfmxntdm5mvekch@5hhumagio6ks>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>
 <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>

On Mon, Feb 24, 2025 at 02:18:55AM +0200, Dmitry Baryshkov wrote:
> On Sat, Feb 22, 2025 at 02:00:50PM +0100, Luca Weiss wrote:
> > Add the necessary supplies and set an appropriete firmware-name for the
> 
> Nit: appropriate
> 
> > modem and enable it.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > index 5611209dbfa41d7834af7903535ed3e05604ba63..31ed26c31e6ea381a8942ccf569513df3300cdeb 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > @@ -87,6 +87,14 @@ &lpass {
> >  	status = "okay";
> >  };
> >  
> > +&mpss {
> > +	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
> > +			"qcom/msm8953/fairphone/fp3/modem.mbn";
> 
> THe comment from the previous patch applies.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
