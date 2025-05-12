Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3A1E260C
	for <phone-devel@vger.kernel.org>; Mon, 12 May 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058978; cv=none; b=sJnB3pdG6Z7lMd8EKTdywBhKHGuSLW6zabONsipGcpJNd4ivU9OM6ZsSJh1yCb9n7IvNqS0KBqspVCP2lgOfxJEq+awWdC6rCJeC3I5ouStGflQ59aMm+RtoUPCjpkXba17MPLP4cMYlSczUFVai0ol1ruSJ1RXBa9WqTAshkQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058978; c=relaxed/simple;
	bh=7XK6JgY+Zequf1Eb4RpAPe8+LKRbtcIi0eB/IHQ1drg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V+7AyAb0XL+n0h5dBV8D0t1lwXrWNtblWl0AqQh61OQL8nNbGY3vZ9+UCVy74Mwlm2u8OvQE6Aek3Q4nR7U3k716B+l7VkQNmDnxWrWnCFUKW4bEJ/9S/mIDbMQ20VbIMZk/AyNbd5eT2SvJbhlOF/zUNBB1ZVRY/rDoIrUhCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E5zlS4zM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E5zlS4zM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad2490d7838so288877966b.0
        for <phone-devel@vger.kernel.org>; Mon, 12 May 2025 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1747058973; x=1747663773; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ/6iwA8CFKOFslZ2GtB9HB/9Djjjmbe1UGAQxtuVQM=;
        b=E5zlS4zMguMnX7vsb8aY8y3rUkkCylnbY2uJpBnMn2gSeV869PE2nrRNMWWFqQOTM+
         sdkQNeoMPxY8BkBhYetZESAIKhCEWiNEswzd4jmYxlFdvt0gh/N1wg+V8TBo/41P/dF4
         nTaNLl+po51P27BBhUUEYwDOycAqK+tGHOvPFntJnbiHuExUZtWdyjmsdyzBRfN0ppJe
         3xQagvaRt/VPiRbaidbCF6lIp007xMQXWoA54TKrUqtaWe/luRj10mgSYvCkMmqkF/tp
         TytK/99TzU3wy4arRDMmuEHk3ogLsb+bskyIhIi9gQMJGVfYbjDmE/F0UNXGExCq5CXq
         8DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058973; x=1747663773;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZ/6iwA8CFKOFslZ2GtB9HB/9Djjjmbe1UGAQxtuVQM=;
        b=P0G2a/7YlvXESXD5jyWTM53o5QgUrMIHLGhwFFAglX5hDjpuYhRrxYlGsYvt02dkiu
         dhIzFNWbVZiBUKCJhMgRAXB9Mo9ozM354ykHheYb9IoGdu4M0SK2aWPwco2U/gkypNzK
         BN4xBYC3/BRv8jfV097mIDvlLyiD45S5GwkiYrDc9paZH0THw8ArIYemR/qkYfkqE3UB
         MDDfRtGfGVA/YGpmfGSQ9S3PgoM/3QkiHZPYtcem/fUmjTy0//YgaxTM5uY2bbnhNA/N
         O38fNwtk0BPkF8D7Q2ScIeiujGRT7TtisEwX4ceJgWmhsr2wH6IELXSzHc6W4k8gUaiV
         PwQA==
X-Forwarded-Encrypted: i=1; AJvYcCWGdWtur8ZGPYD8g5XvuBLEKv8W5e0E2tdxbcU90yN78t78EWTDDPldzsEoJpRWO5jKy+JQLuCDm5mKOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Q6+ajmvJs6sydJAoEEE5bZuwp+lSemnLnQ9P5iIwHhMGuO4S
	+fpSkdZdsKDEWryyt/qHb1Qg7WJTj9WhgahOBV2L0mxpI80swurXVYk/eDNfAC8=
X-Gm-Gg: ASbGncsIvf6EIWhVKUCoOGcqWXl+kMgIP4ude7IF1BxEJJM6IqRUHJreh7uXTybKqhA
	wdDC3M6+ea/+/XNocnJPZz2U1c++wlw2E+Bj31gg9Y/ebkX2OKtFxVLLCvLZ6xIHnAmM7ltiQH2
	RqBGdPoCtZTqM4NM5Ut5LYIqgXjtr4y1k878X289GHkvxcanGUr8TdGtLjtlP9xYCMnqh0NXDXQ
	ds95cWUYVnne1TKcIoE6Ok341ICwOY4BPJxlw5hb4kp5r9UWkHc5rcp7rce/r74SxOzdJtrKJXk
	EB5k34PGiaSENXKSbycvac3X9w89oHlQOgtPk4kKS8e1nyTwbfhl
X-Google-Smtp-Source: AGHT+IGG5FZn2sqQPs5HV5Ni5h1EziV7iYxDUiiwAQm72o77onMUWKhqMQJHb2DHtLorhV7URjJsDw==
X-Received: by 2002:a17:906:630f:b0:ad2:49df:4446 with SMTP id a640c23a62f3a-ad249df4ac7mr391806966b.60.1747058973286;
        Mon, 12 May 2025 07:09:33 -0700 (PDT)
Received: from localhost ([41.66.98.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad249c66fdasm278196766b.114.2025.05.12.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 15:09:30 +0100
Message-Id: <D9U8PV79LTVH.38UZBFZD2VB3R@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Luca Weiss" <luca@lucaweiss.eu>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] remoteproc: qcom_wcnss: Fix on platforms without
 fallback regulators
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511234026.94735-1-matti.lehtimaki@gmail.com>
In-Reply-To: <20250511234026.94735-1-matti.lehtimaki@gmail.com>

On Mon May 12, 2025 at 12:40 AM WEST, Matti Lehtim=C3=A4ki wrote:
> Recent change to handle platforms with only single power domain broke
> pronto-v3 which requires power domains and doesn't have fallback voltage
> regulators in case power domains are missing. Add a check to verify
> the number of fallback voltage regulators before using the code which
> handles single power domain situation.

Thanks!

I've tested this on MSM8953/SDM632 Fairphone 3 which is broken on
v6.15-rc5 without this patch! I've also heard of MSM8909 being broken in
v6.15-rc, and msm8976 also uses qcom,pronto-v3-pil.

Hopefully this can still go into the remaining rc's so v6.15 final works.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3

Regards
Luca

>
> Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only =
single power domain")
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wc=
nss.c
> index 775b056d795a..2c7e519a2254 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -456,7 +456,8 @@ static int wcnss_init_regulators(struct qcom_wcnss *w=
cnss,
>  	if (wcnss->num_pds) {
>  		info +=3D wcnss->num_pds;
>  		/* Handle single power domain case */
> -		num_vregs +=3D num_pd_vregs - wcnss->num_pds;
> +		if (wcnss->num_pds < num_pd_vregs)
> +			num_vregs +=3D num_pd_vregs - wcnss->num_pds;
>  	} else {
>  		num_vregs +=3D num_pd_vregs;
>  	}

