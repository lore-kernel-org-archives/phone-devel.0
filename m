Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7FD2E854
	for <phone-devel@vger.kernel.org>; Mon, 19 Feb 2024 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345848; cv=none; b=VaAV5RW9sxkw6LE07NQ62dQavZ1+00PcvDj4mqs16kU9Ggs3kvQ6NVogIWejyanZI5cr4eMU6lnXDN+SLrozU8FhurxTrIUOpFkXPcEFJfPSdS2wNXF37VAQqVzY4ayEra/PR9bm1B2vwGd6ZKgaKjsZGLfqZYXCN/wGKJ80a18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345848; c=relaxed/simple;
	bh=6SSJUaw0nKKP3ZKsGMyfMQFocs8b5O1NPgxcoNxhRVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+0M8DWLvTA4xpebSxMRS8v7cBOo+da2sRrIgtUbodHRO7TOdR7pUztiEzCvql9igiAcky4k4jeWJvO3QERz4Usnbmc4F66xrEhECByr/aQ7SYUNF23JqmehVH6H+ySeJ+rH2HZodqTTjiAFyy8kcBSAORrflTrqOSoRNzhgxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1+OfYRO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1+OfYRO"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5129e5b8cecso2582051e87.3
        for <phone-devel@vger.kernel.org>; Mon, 19 Feb 2024 04:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345844; x=1708950644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
        b=i1+OfYROEjEYnJsKSPdC/CMVppRT001BAfBoejGxH2+o0s7GXoEhYOhHYbCMsoUbV2
         pfCEsaZiL6EHvQ4Hy3kVdMw45c3bSIhK3a8bnmvnjEwYH9N3XX7xoX8WvrGH/Z1Ez0NH
         SJiobKuOP5vhNFejuNo8yPVN2OEEUWdzwmVT7g+oDQTsulQfdh1u4W2hfZb6A2gQLNyx
         5JeAU+cFmob8Htnqyg0Z65BGjUInXE2J8vd8HLk3fZ+oIdQ2Fps3K4QXdhMXVxAbhjwh
         /bjwgEFKutFdRECayY9Y9BFHkVrRR/BHbtPmOG9AwnD6L1cI1taoKzQH6LQpXUoRVANh
         36sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345844; x=1708950644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
        b=mmu+yi7sWB26LGajZquxJcFitV2FM9aqboGZQsIZ3O84wB4bh0qU2C15lBNbymk1cg
         5rRjQVt4ssRaca8bxB0H8hPc9wNzxubydadDNsIAcNpn2oSjwBI/oJu9M3fYyos0rYRm
         I13J9bd7JbgcObNvVV2AOkMo41AJotkP4ZuE8yG9c8DojEtc3avyq20i/iHauNR9kUDf
         W8tZgTqZacKdXr+bqZ8bnK8y9Bb73iOJisQYdG304iKC/e5+JbY35TUOoDLCU7yLQO8C
         OEO94xZf01C632shsdEHdgqPnZoar80GPb7zbHOydeEymX2vvv9CQUtcT91FEQ6LHbAE
         9WYA==
X-Gm-Message-State: AOJu0YyKbHAngIl1SuXLP+PjPuQTfHEzcUGFjWnw6RXbY3aAfT5Xu/vT
	XvDzDtzXchRsNEP75JlRegriQngW6oejpfMZ3bfziE6otRvnroM/stTgS2w+I30=
X-Google-Smtp-Source: AGHT+IGoP4Kc9T7+0vrUb3lFQohpsZ0w3oy4cAILJsX2XN0cHTj8EK4Nqbp0ilMeo3oHJesO9tXkfA==
X-Received: by 2002:ac2:5e8d:0:b0:512:912f:4bb with SMTP id b13-20020ac25e8d000000b00512912f04bbmr5296326lfq.68.1708345844597;
        Mon, 19 Feb 2024 04:30:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 19 Feb 2024 14:30:30 +0200
Message-Id: <170834569497.2610898.8605974222285085772.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 21 Jan 2024 20:40:58 +0100, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Adam Skladowski (8):
>   arm64: dts: qcom: msm8976: Add IOMMU nodes
>   dt-bindings: dsi-controller-main: Document missing msm8976 compatible
>   dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
>   arm64: dts: qcom: msm8976: Add MDSS nodes
>   dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
>   arm64: dts: qcom: msm8976: Add Adreno GPU
>   arm64: dts: qcom: msm8976: Declare and wire SDC pins
>   arm64: dts: qcom: msm8976: Add WCNSS node
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: dsi-controller-main: Document missing msm8976 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/db36595c6889
[3/8] dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b63880de42b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
