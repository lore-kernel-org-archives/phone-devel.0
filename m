Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01629634
	for <phone-devel@vger.kernel.org>; Wed, 24 Apr 2024 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713916879; cv=none; b=g1q31cMYbjGGuYxshmlzmqYLQhfn8UVwjuubrOleSDT2uZEy6PcZt5S2adM/Zsh9ZZKahTj3b8y3ey+ZQRUpSiyWXZ7gUaesY7qx+HaFt9TZdf45j75tN4mudc7BDHU3zuVT/LjCG/i1LYxF8tG3Al4kmg0qUkpt33eswCLZhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713916879; c=relaxed/simple;
	bh=FlGCPz9SGenILdhF8xtuorosJuisz2ItVng/S0g5r6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASSfRToK8DO8hxl+A2xL6/g9zAmmt6i2jc4oSkSJKfo8jZNNmUCsm37CG6BhJaAAxXlmA9Qt92NKV2eIaeoqcCtbkva41X6xhcY/vLqHGfttK35YCGUo0+mPNyGW0dFILqZaF1d7as5iwGcU3H2QTIqoJ3tKJHUgHS23e79x64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbuNX78n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbuNX78n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41a4f291f80so24026455e9.1
        for <phone-devel@vger.kernel.org>; Tue, 23 Apr 2024 17:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713916876; x=1714521676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsaJN6SDatJpYxGO39STEsAbfE+Fwe8phzl0Lbv9X/w=;
        b=JbuNX78nqH0mAfNc9nLQragiII5hZiROcV/E4YP8bqSBEnHiD9yXMxZ3ytXORm+96E
         ursuaGKu+aRrFBx5ByVKn2U5ExrGycoKB6X2Y6GuUZUcAhuTwdb7mcXEl6Y4Owb0RybQ
         LL3hSmUk/hLNFHPqcEZ/pFNqkA7CqPSJtoO0R5hWYCPu4GVPWsyfhFFQ6r8c3GW2SraU
         btj+sEWk703LwN97dgqfhhCjqd9nLBVFnmvqdEdN868ITlo5ZAK8XLHrGoPhyFtMDDnj
         r3dAfPTJZO2pn/KZ/y99JUUtMqmWCL+0JMvR5sE1Xll/RIaifyzHWZXkCSsJ80Xo66g9
         9qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713916876; x=1714521676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsaJN6SDatJpYxGO39STEsAbfE+Fwe8phzl0Lbv9X/w=;
        b=KxnJCb2rauNiBOU80VvYJ7SjLmIi0cGZgjJiaj6yI7D9OR/0jRBhrJBaWElAEe4xYl
         j1P5TlBzNFZ2HwBMRILV5pUn+Bgs0M2Cp1M+NPRw5zozDymD0oQd0kyzNqBm4OIJ+9Cw
         VpMLOz7mX6UVohNxHeYd42eyYuu2ppK4NiJJ5e3P/ObywlTZzV/i1YKB5u3AWDlwOULf
         12xM3BIZCpq4ii0aQo8jaJlNjEe9z9BLqi4QmjF/fZk7Oey+k4Hz1kVX/apKRf8IJWCA
         IaSvutHwt4F/34hSjmQCZ+aHIYH7zHvu6KyaB085PPghZJILRS5653xQ/C2CD+HPHROs
         7B7g==
X-Gm-Message-State: AOJu0Yy2NADqNcArwJJNw6VMgewFEpKYarSDjblQFCsnwbQV1P7EGyUd
	TYi8PAg2cf0++v3hTpEoCTR75/rUfL3Z27Oy/uTU0WZ4k7A8tE347KLpl2KjxRk=
X-Google-Smtp-Source: AGHT+IELghywWCMPx0pelmAeEjjnEwDnuikrcmKL/8eSocRVR4XO2UIGCfF62Wk+H62jE6je6spPjg==
X-Received: by 2002:a05:600c:4fd0:b0:418:d68d:f1fb with SMTP id o16-20020a05600c4fd000b00418d68df1fbmr674433wmq.31.1713916876258;
        Tue, 23 Apr 2024 17:01:16 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm11231876wmq.17.2024.04.23.17.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 17:01:15 -0700 (PDT)
Message-ID: <4028de21-33ea-4172-904f-e6809ef9a878@linaro.org>
Date: Wed, 24 Apr 2024 01:01:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] MSM8976 MDSS/GPU/WCNSS support
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240413170317.34553-1-a39.skl@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240413170317.34553-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/04/2024 18:03, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Changes since v2
> ================
> 1. Disabled mdss_dsi nodes by default
> 2. Changed reg size of mdss_dsi0 to be equal on both
> 3. Added operating points to second mdss_dsi
> 4. Brought back required opp-supported-hw on adreno
> 5. Moved status under operating points on adreno
> 
> Changes since v1
> ================
> 1. Addressed feedback
> 2. Dropped already applied dt-bindings patches
> 3. Dropped sdc patch as it was submitted as part of other series
> 4. Dropped dt-bindings patch for Adreno, also separate now
> 
> Adam Skladowski (4):
>    arm64: dts: qcom: msm8976: Add IOMMU nodes
>    arm64: dts: qcom: msm8976: Add MDSS nodes
>    arm64: dts: qcom: msm8976: Add Adreno GPU
>    arm64: dts: qcom: msm8976: Add WCNSS node
> 
>   arch/arm64/boot/dts/qcom/msm8976.dtsi | 536 +++++++++++++++++++++++++-
>   1 file changed, 532 insertions(+), 4 deletions(-)
> 

I remembered you pinged me in IRC about my previous review feedback.

Would appreciate if you could add a response email to your cover letter 
explaining why that's not done.

I'm sure you're probably right but, good practice is to state in your 
log what was and wasn't done and why.

---
bod
