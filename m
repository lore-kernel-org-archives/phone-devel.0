Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19536401A1E
	for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674208; cv=pass; b=G6qPk5/lnT4JecO6l93tlMD4WaPsybgDoaMe+DabjJpiFRzAIeTNrcfaunLsac3HNfWxHRsJUq2N71yl5WVf6r/x9tF6+UfmDgp498VMuDgtydvaAWhZp0aRBpqaKc5e0RaGRWwMoMjcBwyKpJ+WOonFwfwKEjFbUr/2buLud2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674208; c=relaxed/simple;
	bh=n0zVUgor7lvWPciDrZ5fzZFpulIyyAJJoNWui7A5iR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLPwRBAsuyFxS8u/0DzCWSTeSAV4deW8lcwh52lb98bFPzCKTMLl6gACp6ZbEDgUfzeNOY5Aab8I93U97eRnMhU06kL51brI1Vsk8JbiMFy28fKbODuXiXYBkZhDLRC6L8NTREuLuiGIctlDDQj9NfNJjg7kyoOLpZKNMmcSKvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCYB+wO0; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCYB+wO0"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-631ca15d35aso3024753137.1
        for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 05:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778674205; cv=none;
        d=google.com; s=arc-20240605;
        b=Wwmh2oU0/QTOxZKiujkIezZhSDrAc6P95YYWphl6Ei0JpSNqWss8mf3o2ZoAsfp/QE
         uUw+nKH0HLbHR/x8nkkK9EIbYVtVXRHZy/eQXl/HKNYeJYreuBGTF6r4rWyYZY9HOSsh
         rdjNsu5MLwhbFza3G1bUJkbQ8hczdoU58WBlcxZZxRW280zRFpJV4aghvlCN/+wFvqLM
         /XXcvYajoabgFt24TmowG4ijmfYkb7aaRtqbyg2QqYEvenDTu/vkMNQ051LMJxhKfBws
         Mm6SjriFpnG88unySFEUG0tCBegfHEFxV8ueniuznQIXnLUE4N80wptSswCU1yLQAZlp
         NZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        fh=9+f6SSZ2ynbLBJyhNHdBSbqxckl1GUpR+P1DocLeaGc=;
        b=Z45Qcih6OeorGBNTXmF7SXNEW2Uow+MPddknXf7hVsimJGp6S6aaJQVt4gW3R9CqCG
         7bUjhLg9JREHE4gGdlkWdWBGj6+5XRrhyU6R055yFDUKh0JfCXHfDGg8sqIgJ6NwSIv0
         HqlQqiIUfHxq1rMj4u7+N3BWMjnyYFLzf09rnXepQxkjfgkzMJ8E2qGM2OM6slde3MVO
         N2MLkF7RSD4WdBvHxuXtJ7tidj9GLfmfSYgz0DgXMW0h/uUpFF73XG3bRn17hJ33/mgg
         ADUoMAl5SN40OgRFg6VRCOAd7bZjH4e/hHbyUO4IEgH57XmaL38f++y58kM2MKfjQ46E
         9ebg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674205; x=1779279005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=gCYB+wO0Vjk0gM8TRvgCzUZgfJeRk/rcSWpNtrbYbOOl8CDACWO7ncXQBg+A5Z/i48
         TIQjQTLUb+drdyNoBtGHfSksYjpHg9ms7bL2kZWl8hbPaHgGrGnEf6+gmM/gG9t7ZCKq
         0DCyJ887g/t27B8dIBXKH38oZZIbJI0XerGKxfiDSEuUMz9f9hyeryryr9KvWviMP9ct
         hH0uarD51tGgLBVaTwnb32e3DKyTBlGehJaJMq8oCLLPelPkJ+za++8wxxTThxy8saac
         ct2eduaZwU8lVlbhpXphBZfDM8LaNPDzMG7X0eynmOrqKwq+zznKcFZedrmKQnAIXjqT
         Qdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674205; x=1779279005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=Y7OFTU0kRUElVy9y8KoslSm/PbRYtNuhYRumjq1FeoG/M/g9OFpNISf53Ymcc3oGm2
         oOf3ZwSAA8FwbhfL6dTRB8Q4R9ck9DBrBUcrywHYy2e5WkIPl7mMElYLCzgPPUwYqErH
         9t0eZMoByeC2Vl3RU+X29H0NSypScH9xwNKrx9CR+CdJOe9MbpuwdXn3hptbTjTlchX2
         Z2OsnbmNl/wIaUpb41anExAOf/HdE759wDY35NukaFb0TvIsQtgQy6nCB2dLd7wVwOS1
         LVKcKxn2q8gzShBcAJaDg81XmhYM8Zkfl/A1WT6xGQmZxsa1sJJoYFxO+QqxwSVsob4A
         34Wg==
X-Forwarded-Encrypted: i=1; AFNElJ//fmb8IW08txoCjBlzIvzFkWG35KRppq7XAfSjUV16EOSbjc4KiHfOCXKY7FYX0Gob3AZqGOaYiJAD4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKxXAM3hBaOtnj9bXH/VK68iia6VXNL4ngHtlVRN0yxxuPIscq
	TCNjhodGeaHXrHLe4Sphxo3qzF/VMRemNj87MMeTMvy0fxnTcIIVxNzrIzB2FRobv4D20ic1KQN
	r/KCQI9EucVvH6450rD9T+9uBBIesE0k=
X-Gm-Gg: Acq92OGFc/xXb6mubcYILVXyOoC2nxUkh0ISYtekYloBGDZISFYWOXXlnAUOmmvZk7w
	E4x85E7PkyG5ZASZwBj+a4PdFktUoQ+v3c+Co43c/I8skLB0959YuqcPM1Qk2XrJYHF2gj9fIO+
	2Zq2vJnPZHMYTneNgBxx4FZ91UuebPG+WkXliks02qp3jR9vJ7YIgt1RQkH2jSXfAIsi23EOKq4
	A6pNmdAybaJ84u3FrPTCLkvctE1+tqk6NdE8Bd0vOAnol6wNdAFsPS0UqW5L1wHat0Wkj2zbRp/
	30o1fmTe
X-Received: by 2002:a05:6102:38c7:b0:631:d445:171f with SMTP id
 ada2fe7eead31-6376463539amr1094442137.15.1778674204715; Wed, 13 May 2026
 05:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com> <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
In-Reply-To: <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 13 May 2026 15:09:53 +0300
X-Gm-Features: AVHnY4LglPfFc_nbVIjyAIVKXzzO_CSHQSJk1Zv3noSm1yMcp9X7Hz7jaJLq39s
Message-ID: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > generated using linux-mdss-dsi-panel-driver-generator[0].
> >
> > The mdss reset dependency makes the screen work more reliably.
> >
> > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> >
> > [...]
>
> Applied, thanks!
>
> [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
>       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1

Thanks for applying, but notice that this is an old version, the last
version is v7:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The compatible string was fixed in v5, and other patches in the series
were applied with the new version.

The difference is in the compatible, 's6e8fc0' with a zero instead of an O.

> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>
