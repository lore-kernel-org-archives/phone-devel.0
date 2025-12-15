Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302D3242C9
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765775897; cv=none; b=Ej6FW67cG1PSD4/vZ+yo93H7HsL9yVSH01rBcEjL0InYAcNHbPk3zZ2jFHQ+IYDzpoZOuBNs1P6czrMudNhpARP9+lPK07DO5y0DDr7ou13snZYUh6PtBT7iYF2vu3V0BMIVTYrd+wp5N4vP/2ea0+v+XZvEVbzoXkpu+ZJYBqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765775897; c=relaxed/simple;
	bh=EyhhTu6tEajuduNp4/0le6GxWfnSGbcGf0p5nThcZrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9MKxUCavxJmS3S9fS74shs/J2wSIBvUGnijBCWO7ThoUf6uoFlUcBbtS3dU/NaKD/NbVnb7xJ6CVaMbfPXtCtRmoKfWHnGzVorrJdJZfivo72zP9xRZmmi90USwiEuikPLK6KPjh7tqjgP0UUPm6I/mtmeMbIsm+ZsM37ho6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwfl1z6v; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwfl1z6v"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-298287a26c3so38363005ad.0
        for <phone-devel@vger.kernel.org>; Sun, 14 Dec 2025 21:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765775894; x=1766380694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYGV5sGRh2yeK6uvxRn1wHQ6jEWyDVrINv6+U1Id/8A=;
        b=cwfl1z6vO+qUVJ/kEpR+Lr4aURVQNuPWddaQ+x3kC1SqBY8LBgPG4p2wcQC2IYlFgK
         lBqoCFwgRGdrOhhnviFX2J6A3YDDQAfEXr5b6bAekBTp5VzNle6WThA9PCFpEDFPrg0T
         NptK1k4/5IOPxUqF9SgOojtd2CUSc7NbqsJ5Fo/VL0A5pe6u9uaC7OpDoULsTvscXQsw
         7mIRuAGaY7aKV2luDl/9CCLUc57JZL96fvQaivg68pUM2Rpa7cI2MqdfDpwJybGtrLhf
         mG5XNJ7gspEA9ayj33xQre90gP4uppO+8L0JjzhMzcXt0Lelj5SF1drE06fzzq5BQ4oH
         g/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765775894; x=1766380694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYGV5sGRh2yeK6uvxRn1wHQ6jEWyDVrINv6+U1Id/8A=;
        b=P++3h3JU+XaILk0iDHfX0MrVTWSIUWinT7hJpQBV5e243gKCWQKBE35I2xGSt+CkW/
         o0p85/8/3hu+jP9mB0GKttHkrPEaQu0xROzyH5obG4c4m2o7ukyXQHmtHEddrf0NtW4O
         5ICOujLMsJ45IR8MMM097K/lUbBsHtmdlLKpxcMHHShjNQtwhOdCJtlCHBx576vUqOQc
         n8ikApe6iDB32NsK2UFoebr1PZjzDUZUSBZgrYZr4qLWYaCD+XExzK0P27CKJM7rVvl7
         cukNu9P/jG4/Qgc06FOJCfsF9ixrpQoMWu9iha5e7YTdUB40X+5KGiaIhul4pkmfbuZc
         g5hg==
X-Forwarded-Encrypted: i=1; AJvYcCUv++9rLXU3T1bYWlZSZl4/2YfWY/4+0qZO6z/BVj6HQV1rDJBIpELs2PFBAXNbDzd4FobgQiThm5xqyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIDwXwCtFvEXk3FltpyrlnVLGpOkVYHf4F2/zqTMKTPRHpM4WG
	w2Z64fIHShwk+yIN3zPH4cbREQ9iUQPV/cDtrzVu7ffnGoBYqXpeQhFtdqlpA/Zrqd4=
X-Gm-Gg: AY/fxX461scOBCwV2TxNg9NW2kzH6yBhxGCQr9BNEs+FzGMYcmlgGr9/MGBzgbf+VTs
	BMWIVOiSfbGLGjuRMXtI22HxjjlenZBYQPJHTJTM8O02cineNERexjY4HJKXKUcfz4eHbDTDS/D
	j5zqMUjuGavo+1aZ89R4VZN1z7MVUDxFsFyCBF5a1Q8Kz6nAcmi3pecIrFCmWE4Nef/XnOVvidc
	n0BZymGhoQ9RlTTQJmeyIhIcoaZAPKWJsbL8/ZXnjXniP4ccpDlWxmBTdd4Z3GNCnPoIy37VkMs
	a/aypWzhZYmlavcT+NCtwtWtdyOBOziNU1d9MsoRhmvsCCY1qR4MpB4iyzYQWcO22wl66w1J1Ev
	BKScMMPhTh47toRnwPTydJidGKqSUyw2c9qa50QjrcQugDBVf1hVIBH77JyQL/3N1ILZfV1XWnY
	t0LswHcL+S/vY=
X-Google-Smtp-Source: AGHT+IH71LGyS6r6X/23fUIRTMHB9hMJFZwpz7dGoHIihSQCvhU76eKfPDxzle5KT+xNtC/kg/DPCg==
X-Received: by 2002:a17:903:1b66:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-29f23caa438mr105521885ad.42.1765775894222;
        Sun, 14 Dec 2025 21:18:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ef4sm122285845ad.56.2025.12.14.21.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 21:18:13 -0800 (PST)
Date: Mon, 15 Dec 2025 10:48:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Message-ID: <qogyami7g3wdvfodttrjqzvmrufw4qaqvzp3jsq6lt6wqshu5y@kofhldddiznw>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-1-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-1-b05fddd8b45c@fairphone.com>

On 10-12-25, 10:43, Luca Weiss wrote:
> Document the CPUFREQ Hardware on the Milos SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 2d42fc3d8ef8..22eeaef14f55 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -35,6 +35,7 @@ properties:
>        - description: v2 of CPUFREQ HW (EPSS)
>          items:
>            - enum:
> +              - qcom,milos-cpufreq-epss
>                - qcom,qcs8300-cpufreq-epss
>                - qcom,qdu1000-cpufreq-epss
>                - qcom,sa8255p-cpufreq-epss
> @@ -169,6 +170,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,milos-cpufreq-epss
>                - qcom,qcs8300-cpufreq-epss
>                - qcom,sc7280-cpufreq-epss
>                - qcom,sm8250-cpufreq-epss

Applied. Thanks.

-- 
viresh
