Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070232E266A
	for <phone-devel@vger.kernel.org>; Mon,  8 Sep 2025 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314599; cv=none; b=WPHFwhZL+ipxIG2mmNQuzOLyLsnV4Hd9W10MHY29MoVIeSY3/vHh25dxNFPJ7mSqxD+9sJ3AVP2Vy3qqE/0pLGELntsLwhcCalB/iSZyOd0voaol43UUvTD7Y440PlsKhivNC9YeRLCKAmzsQbc7tRIGsgKo4EPj9TwVl8JfFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314599; c=relaxed/simple;
	bh=Csq17eCLJmv7/7QqayNfbYw3ZtrTeNIABT5r2MMdoUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2RZQ91pn96Yor0r/4AiPxWz89suTNtF5kqqGIo+7HuLGV++NGdNmELzy0IunA/WUuS4vcGQ8It2h0ESy1qMFI/iZbU7y07d+EEMpt37J5MdfZY0txavcuvKH/vDv3Rvc4Iubo9kYDzeNpZPj7Q+XM3CXZuZt4VEv5THnasqVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCDATx/3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCDATx/3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445806e03cso52728605ad.1
        for <phone-devel@vger.kernel.org>; Sun, 07 Sep 2025 23:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757314597; x=1757919397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfO9YzOQHvlcLzI/Oqj9hLG6esUOkytAkeiwFxmfpUM=;
        b=mCDATx/3yiX1K5qsI/04JjsJivHS4KLolpgblY0iOgK/9Zq+BSieBrZtQLVO0Je/ke
         McavgOlHN+BUVOpD+oxZjjwEymV9gaD0mMBDdCr85p3TrUJlFjmbOdK43DBycCFsI3ZD
         Vjj23N7CES8gSNHEl8PutjuSWBoaZ+JbxFm6UhdF8X72cpLYI/vnxcgvsx/1/lBw7pb/
         lz0Y7BJmn9JPQj82NBmoxl79rKYZMoYbA/kMcfHGPLVCG8Mbzx7LisyXKuTPbn80mSzC
         cCgSLUMCPr0VFZZTUL0uTs0dBqjD6sNcvpCaz2GeEXb5q6aqBwrY9AmJ8NIJbaCr74bd
         QOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757314597; x=1757919397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfO9YzOQHvlcLzI/Oqj9hLG6esUOkytAkeiwFxmfpUM=;
        b=PpD+PSEhjCePhtde3xcefe1SgXcmyk5+qy/rgb1e3gmEcZ8bdk8kRShwxw7CQp6fwL
         9Jd+Kg0cpDq80AWHg5VWCTjswItPB7KyusYDbCAI+JiEod+aCq1nllSZY1f9DG7gzpOx
         Nnv1S80MaeYLB/lFFvwo6Aqb0Lc4FyqUAVNrbOYmNBn3eKxJwcuWmnMgmhZlVnHTL25s
         is2FDUHSGp1BMAPniaq3VRgfFJ6J/bIBwNBnQ1BgwYVTi49qV0nyY7vhpuYzIH/Gi7Eu
         12jipgbcZ7i9EbDVn09HBqsp2oUH6mG2mCbfgjC1uUyH1bqkj3moaSGHMov/JBWnZ+uG
         gmog==
X-Forwarded-Encrypted: i=1; AJvYcCVbjjP7JxRZNqrPTM1FcnIhvQETlqqdy629MfP2mx3BI/ZQvk34+D0Joq3Yw+fkJkzFrsuz48sVKz7DUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFs9v0E+4y+aecMP5Sbte/WdAgMW0/jJkLeCADqMfEx20T2Bg
	1TEiIuRHSsZ1wrWaHnm9G/EQpwRyMJDz4Gc8OQAyguyIRI2pdgAYV/hDfP2h81dx8ic=
X-Gm-Gg: ASbGncuBh5/8vIKzyoz1e1jW0WUDWtV3xf4fwDTLSzxMQZ5xTKoHlC+E/lDtWmRC/fn
	E8+LOyuvDU8dhvgWKMang76h9IuAZBWM/14iKiYUwIudxVVhSDldGC9OTiM9rFaN5pRoynRtXVs
	qNdQAAT6kcx64QOr37iaNttFeR03coImdcEOznyCKI0gFNT0WfNGuBUrtK5L/dCHoZc2NnW17+s
	qgVevghrIOX8eSgbrQHms0YdWmmXShmrs+ginURA4N5OsnVqJomOckF+sdEpEQsMYZ3htkjxmQo
	IH1nggJXG0jwG0IRvMUPg2ppUL4Drjv570wx7PSuMjCoRPxcfyjMpO/dPuh3Q6ANmf0tJMM0zMY
	truq1OajnzV0PYDG5dVelgnPkCZvUpy2H38w=
X-Google-Smtp-Source: AGHT+IEqN3OfxLAXjoh0BbnNn+jKgNAUzLVPIjM7aPLqTsUdL89FPCgDXAlE/ux9DfFsh6AFqBW7Pg==
X-Received: by 2002:a17:903:3805:b0:24a:9b12:5248 with SMTP id d9443c01a7336-25173ea1a3emr108269335ad.54.1757314597217;
        Sun, 07 Sep 2025 23:56:37 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b905689d1sm150907355ad.64.2025.09.07.23.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:56:36 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:26:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Message-ID: <20250908065634.m4p4tmjyb7h5bcfq@vireshk-i7>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
 <20250905-sm7635-fp6-initial-v3-1-0117c2eff1b7@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sm7635-fp6-initial-v3-1-0117c2eff1b7@fairphone.com>

On 05-09-25, 12:40, Luca Weiss wrote:
> Document the CPUFREQ Hardware on the Milos SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
