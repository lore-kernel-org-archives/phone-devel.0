Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDFE47781
	for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088168; cv=none; b=WhEpEYSm0ZlmxB5fNKM02hikfDvGVszLScmiN3T/ghoSNxWJs+lrMwWm4VOJh62qJeUvxSqi5t0rCXu4xvbzL5U/9d7mvvaz0Q1bHI54kzIRYxW6T4+h0rxzXr2AAJU6ORiPx0n8m8r+vWLxRFuXIaTAoSla98jeNncojTSmfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088168; c=relaxed/simple;
	bh=FNrmY43/YCzNI9mINWD2Oip2Z3faB3SaM34C9EeG3bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rix7Axp88EBoY+IwsWLwmJZAsZklZX6wy3vfP56xTH5b3JqUdrXI8LeJLXPZ8/YoABTJDxo3QSaGwSxKNbJ9G09MBrZCNzoSWMVgYq1C/ro+2mXrS5+3T3rzrHD3ZoZpVVJ+bh8/QEeTVBNGj7tA8FK0qfsP8ysDawIscYx4Wbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyC29hpk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyC29hpk"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b82d57963so444424e87.2
        for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088165; x=1717692965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cIZAyHQuyLuODFacqdYEeEJFSKlS0O4NsDUdsqJPEQ=;
        b=xyC29hpkU8lb5bGyPHU+LV2WHOBHZ2K+zp9S93zTm54DA4visFwpvjQ2PI/lb/ZJIc
         pjoADgtuh714Ap86aZmUtR5XDDBajF1Q+8XyYJf3gsbiMFuE6rYiAKFItR/DqnjQpSW2
         ms4h8CbIFqK6PtUKuRoPFQ5stjfllJB2GnJxVju9JSbK64ajXpSDPpI1jCpGBD9p5D7D
         hX16oVcAegclQYRdTI58l86zKLYTjbHsuZtcptbq3GdHGQKaDrU8aR+tRzzSuNgq+xvX
         9AnwQyg9NLVPcs/0D1KHC6sBXWh+zBNL4VfqXrbtKTC5dMPvqYpFovs+jyvga2fnmdLT
         wldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088165; x=1717692965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cIZAyHQuyLuODFacqdYEeEJFSKlS0O4NsDUdsqJPEQ=;
        b=gn+Iy7R9sn2xy2K+7eGEMvUsrbRxSM13z6feDEMNjnRxW+EZGmxR7cs2B468CwtHVA
         i1Ix+Z8lDXotD/4XjmKKr7tjAtgvBDyNAlDemhoWktL8oaEiz6Cq2f7SswJtg9dm7VEr
         4mSBnds8J5NjEI/ivp/qpjrpkSn77+7zq5pFN+CcCf9Bnc2TqdiBSjUJrlyTOgxfca0x
         M+amw6FqMJg6XtJRPq6AuWoACtowdBK0AnGSV7h1uB+ztbF627kiRGoHH6pC+Hez0Q4m
         8AzEid/tgR/k1vfBGsYLaoCSFlmJZfsAOTrClQymIAA+PqhQ0jg5oU8mm0z9GxKG9OGI
         41IA==
X-Forwarded-Encrypted: i=1; AJvYcCW1vhTeV5mDk7IYN57CoibCsormlMTXQwxn3AAkDnXs4sTeeBXewmJAWaXpwQpstpwNH8lXAEgRle5Zq4KmWx6o0yUmMkLKeOf5uKA=
X-Gm-Message-State: AOJu0YyMxDddUl+Fjti68UzgfhDwp8wimM7jcYeUsD3/JC4iyHQx7TEj
	mYHfn3cVkd1YmznQgtHl6whFFSEioV8/ctD9nnuu82BRu/zuqalB+YbPcY6dc/eVm9gIgyhO4L8
	f
X-Google-Smtp-Source: AGHT+IHE+Ow+K5cH0iKEEiLQu1RK9+EhmsE5q4RgF+Mo8KYrQlphENI6AkOOWkHJbu2VU2gveInE3w==
X-Received: by 2002:a05:6512:3694:b0:52b:7984:2333 with SMTP id 2adb3069b0e04-52b7d490620mr1600521e87.63.1717088164719;
        Thu, 30 May 2024 09:56:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7870asm14601e87.136.2024.05.30.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:56:04 -0700 (PDT)
Date: Thu, 30 May 2024 19:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
Message-ID: <zmid5knlldfg3rbp6xlanc3fy5siyddznn7cdryo57bwxk4ntw@cd2vkkuvstri>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
 <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-fp4-tcpm-v3-1-612d4bbd5e09@fairphone.com>

On Thu, May 30, 2024 at 05:05:47PM +0200, Luca Weiss wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM7250B. This will provide the VBUS source to connected
> peripherals.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
