Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72B13AA3A
	for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220824; cv=none; b=Pc0RamxS0JQbm+E2aCw8xm0K7O8NOXOfKKJJJjPDR7K3Te6TfszthpJ5mscpocnkfsM0/JMO59qw/E71mVosouWHXiHXexQOzGRo9K8Qol+p2ejsXdLi7p+fCI4DbEBYZagXOy2Fp+4BR0UKTcxaDPiouJbjhdW0+hNiXglsftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220824; c=relaxed/simple;
	bh=/q+OKPTvjfhtwgZQ3LtD4ypTdtx/UFBmU0i1AagUJwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=du94KN9pexieoVFfRqz2tA6rf71efLOb6IgZEL1aLsVJUORY0khRNf1Nmt8uWpn2sWMaHlyGIpwL/tFA8fcpz0hue9B+54FrsQLCwHVrgpGHFjgRu0odENjdSrUn0QXXNOuiHN/Ts2oqyGekgXeSef/O0Zj8UHHz+iSc02cSKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bW2gQW2s; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bW2gQW2s"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso74978577b3.1
        for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220821; x=1706825621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=bW2gQW2sQmAslc3/bpTtAV5QqH6TAAxFQ7V9JEk58Cq7AkNeKTYBKSir+YX4kZvBfL
         JICtdNL2fOWOOe43hSPVvdmWUjPzsHfuXp08B+scFUSFVk/p9Q41rvQHt7GoTTgfk8kS
         XtVDn8RZ5tbcQsqmZK2/HLNXVhib5iEpvoArs85b/PC407wLmc2QmOPMllWxzqgkHrAZ
         SnoIVQXKpw4KUtAEJP1sEjtPa4+LjnxKltA2WvH9MIqae7ytMawnFPt2olm/H0Giz+2X
         PMH1u87jn0KiQWKtpXmp7jXnrrwYINDo+RDJVUQMi4Xb5fx1INXPKEgWvASiEPRpSKI+
         6mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220821; x=1706825621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=fUpFIZZwKmC0BlS0aVtsY5dQxK2w3V+EiS8CGJt3WbjX68bHIxpxTUZCr5FWfL4Tf9
         s4oEO7ycqF9vhtAXPJNQomcjrdl3DN/xbveDM2I6IjjRr30CqUtfZ+fElAmMP0JRdbUf
         /2dR1c9SB9I3zr29x2LKyHVAnHIOJSAa6gUDv2s8noOrAyTtxbgkW8KLnBqr1+2tv50R
         k4b3wuof6dHo3PQ8gIDGjHcFaiTz4ic8C9hqeTISuaICs1kyTdOe5zAiqzRqK1HKbtoQ
         T9XO7/SSLHSVBy4y0dgOzuiP1Yz5VG5Wm8+0alQuIFns2hE5YtJKFmjUFb5voXGrHxKa
         GCqw==
X-Gm-Message-State: AOJu0Yx+ccY0KxThN1uuoOpV9oWXLFU/pCp7237ZaewK7ePDJbo6GKUf
	5AvqAhVSz3+cbV1c1XLXbdzEIna4+TZDztd3HmvW27Cs1D3PZldWrTEKiHfc0RzvAYN/n8ikgOM
	Kzj5uHFe9+wkst7SUuvUcVOv+woVoy7hs9P0l/A==
X-Google-Smtp-Source: AGHT+IE3TWyGHNGHsG2xqF2JXCIF6aVnGmnqe4/3CyA3myFBwqZCxjCHe2OS/OaFjyPxVBpRCKQb3m3/ij+f63iLZtk=
X-Received: by 2002:a81:c441:0:b0:5ff:7cc9:1691 with SMTP id
 s1-20020a81c441000000b005ff7cc91691mr475647ywj.70.1706220821421; Thu, 25 Jan
 2024 14:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-msm8953-mdss-reset-v2-0-fd7824559426@z3ntu.xyz> <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
In-Reply-To: <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:13:30 +0200
Message-ID: <CAA8EJpqb_FFUzyGR2SYH7wwrDCrC8Wy7QcUFyJgHqAvx42Vgfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-msm8953: add more resets
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> Add new entries in the gcc driver for some more resets found on MSM8953.
>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: expand commit message, move entry, add more entries]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/clk/qcom/gcc-msm8953.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
