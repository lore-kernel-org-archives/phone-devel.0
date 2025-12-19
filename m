Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110413242BA
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149268; cv=none; b=OQtQWy5/PS5LNXePhbNUtgLXKJ+5rXT21ly4CLr/vfFxdFj+G94qu1zeqYIO7b9K+nccZxTFApm7vkJbLys9TtqMelcIJUb39dNBP48A5P8bvfqrj82TjvSJNGuFMYRbVDDxFsDIDlbUFC+j4O6Gd68CMg+KYdocDuYWC+Mt2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149268; c=relaxed/simple;
	bh=OMj7xeqwJMwjOl9SBTbfE9Y8LYVng9ddlrSM4o/HdWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WMgPlYvOqz6/jDv8X/mwYXZvT5jpNt0pkSyaRD/rzBS+n2sD2AX4HWM/3hgxGQKg7dbZ5cf+siNlGRKTvX5FfR+6LYnkvg80lMqiatfYZ9vtjQB5m2PVePhXn/7R91dlPgRjQ6G0Cd4a8v3KILZaKGRyTAn9wlYcGxrKu1qJCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Nxw1pCJe; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Nxw1pCJe"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso4142316a12.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 05:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766149258; x=1766754058; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH9a092t0vWzb6LlKTi2ntIznrIkgJiQ0lVDXHwlCgM=;
        b=Nxw1pCJeW6oYa0o7jXMT8/6bl0Qhufe/V6WkUqMzXlQARU542McV65Oi/jPSqlsZn/
         1GLdq0p/m3WxvDD27Z0cwi61SyEJ8ka7YygzMCSArhE+byrxS8Hr8HnQc+mFNmbWRhh/
         ZewHkSu1CVwenStJijMPshEsPoHM5V38SiDf9YLrQ4DMYZGTURGhWO5HZibBeZLdl2Tf
         H7WM76XqfwudX4lwdNHmTLSmc98SAmLrhTuJZUtEPCx04ER10yFEww5SUJ1pz8sbXLMC
         nMhYEuF9q32CvQYex+TBIFv+YYIcSczWUJet0EPT/rwbpBo1SnPYWfpEOISQpAJPq9RM
         iLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149258; x=1766754058;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH9a092t0vWzb6LlKTi2ntIznrIkgJiQ0lVDXHwlCgM=;
        b=Wd+Y+AEnLqxYlMS5AGk35ElGuYNukPQZdz3WY11BczKUGAwbBKwE76YE/pJHyCn5df
         t1hnTac5cDEufB1+neuPcoAycGqSd1XVQcisKiLk/mDMd67wGIxx71eLJOJpUYpfcHij
         m7WS9tBFflcsmxqA+HY/e/v33VPypwAKo62wKMwHGA+4+jARL8zEvwILvoZ/2OkUkzxT
         W0wmlQY8hB25aaMuCZ1xAVy9FHfJ7TGE7v5Y2JIFmFRSKquX6L+/rwOzg98vOXo9gXoi
         Oa2qtQeyErJCOYJSUZIpiaBc5Oh1QJJwl0xtSvFME560CMK5irK0p+onKhg9JJbhZOAc
         0jeg==
X-Forwarded-Encrypted: i=1; AJvYcCXmmAPkekfUiUHJTdjTPb1JDOWODI6extBKxhzAMzBu1I9XYkKVRe15+Z688ca3MOdcqDFqin9RjSptbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJM3lIwBZlM0OaopxT80T+5h/nLHzejtIcjYy8ID3iIfS9lC3
	xoGqPsRRpnQg2NFkZgfm2U4eMnJagSlPpVIjo7AWsZVidJ7OZlWyPSce0zoat1DV/h8=
X-Gm-Gg: AY/fxX7SVCAegr+ZOroNSXpJMAjqgiwOPS3BV9h3ApSKCdEm6fiYG0n4J+AHy+1kNEp
	/2WX2y3uhRPKhdxqMvy47Snn7tTXkXCC1F/iWh2Z6/IGAmKF7A4/oawJj+iIFPWmYsjJKhXATIg
	WpQAAJG1y4vv7Sb2zhR6eTN1pAYPU6UHtLLJgpW7fK0IM1JKQARePRrxbxClOcAN/9BoNQ3BHQK
	N8/GRV5nN3yNwix4oyMBX0MPHmNufKa6nG3nRz4VeQd9uAqMyO8JAV4Pu+fMngXuxOpX84hjOFi
	uTYBDlwrSxbkctVfrPRBerhtNxrSuMdtxfHeT0//m+95w+jCo+Jw1QlOx7H8nEFGQ5Blpgl/S7X
	d7VzrGiU+WL41YBRW3wKtUOQcaFfAYXvvYuDQ3NOENuQMD7x7FQrXfI2mjBqQN2eLM5JovkUzMc
	/WFRbJifQdM/UOSAgYWwE+ik6vxwrR81t6lg6Bnb8VfS4hsuKOlWrOHNH4hwhMAZkGWVDbZCuhj
	vj6i6oEBhIJy1zrt8+ZYC/u
X-Google-Smtp-Source: AGHT+IHLGt3dLozOmdXSlTcHVXCnuuxt1U6E7k8MjKzoQF2b3nEBMoU2ft3Yv3cwbA/6YNKG+iAu0A==
X-Received: by 2002:a17:907:fdc1:b0:b7d:266a:772c with SMTP id a640c23a62f3a-b803574c34fmr311215066b.21.1766149258484;
        Fri, 19 Dec 2025 05:00:58 -0800 (PST)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de11e5sm223530866b.39.2025.12.19.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 14:00:57 +0100
Message-Id: <DF27NRY60F8J.19D014VO387TN@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>

Hi Rob,

On Wed Dec 10, 2025 at 2:43 AM CET, Luca Weiss wrote:
> Document the Power Domain Controller on the Milos SoC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Looking at other commits in qcom,pdc.yaml, you're the person who usually
picks up these patches.

Could you please pick this patch up, it has been on the lists since
months, blocking the arm64 dts from going in.

Regards
Luca

> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.=
yaml
> index 38d0c2d57dd6..0c80bf79c162 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yam=
l
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yam=
l
> @@ -27,6 +27,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-pdc
> +          - qcom,milos-pdc
>            - qcom,qcs615-pdc
>            - qcom,qcs8300-pdc
>            - qcom,qdu1000-pdc

