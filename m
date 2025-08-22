Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731432D7814
	for <phone-devel@vger.kernel.org>; Fri, 22 Aug 2025 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858112; cv=none; b=gRrwSTaN9wft+6FZn4K//K9577cDQJ/rgm/Kcdrr5odj8ZbHQiw/+v7Ma5VI5moHX0JooTiwJ/fjbTJ2h+Cw+Lat1SvM351ztjztqx8VpiDTcygfQTCF2oJ6nA2sxLMvUpaXZgIcTO+ZUA7AoVNLtrA777BB3MiD+skWQNFVUG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858112; c=relaxed/simple;
	bh=n+uuSrn8u6juOkuP9SvbxcjWBcwiQZYJvcqO5SL+OHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqkXcfKxG80zTz6KpGzLZmCsErWedvdF0u31KRGUT01TOpesu79eu2aXkAHqyiSQIy5kOgRpZaCXfjPX2D9FcZ4yM8FtuRQk+dKRVQpfCbTUuqz5SDBKmmiqVdwcPGUZ25ZQdSBvPCDJ1ppa7zUVXMkG6EPw1YnY8VUWe2zZOnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LrKZOIKa; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrKZOIKa"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30cceb382d1so1649622fac.2
        for <phone-devel@vger.kernel.org>; Fri, 22 Aug 2025 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755858109; x=1756462909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDx2DLdAKNYscUVXgj1y9NZCkQ1KxqDufjQBp2yX34A=;
        b=LrKZOIKalIirnQAFL3UxkjmNVxTC7BrYK8fguIuzdtXsXpcB8OOfVUqfaIgUMo8MQh
         cJBUPGp3VNK+OAOv49lKvZtO/TQDq+6SVPU/xCLYz+QtV1l8LukJqndq/s4uStAXmFlC
         ycPxfa/mQYGOda4mdl7uZOMS3qf8eLLcG71So/Jalw22cNo5rglqsv1YCEJNdNmHtgcP
         PsFNfvKBNmvhL9BKroPRknwXbYq0PgBhcmNqxGoQBakxsMZ2rwW3oQPgcsRL0Lj90/l9
         dYJ6Ty1PdkIl1QdnQbKMuFw9SdltrWPNReAFiHIhs0ohDhIwohtQl+RXo0bSiuV/kffA
         Jgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858109; x=1756462909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDx2DLdAKNYscUVXgj1y9NZCkQ1KxqDufjQBp2yX34A=;
        b=SnKcWXhqSRYkXYBaxzVqJPGAWefLAQjChXplHVLZ7fuRRKA79D66hcZX18M4cKyWuI
         XAv5uiYl0Mmp61r2u4ixDOI4xPUta/SvnpJkB9RCtWM5dgI4xxdZ4TENT9n2IGOHo/yu
         iwABFg7njgDstBWvHBu/+sRnDUY1VKTHsWYyEtsdRl9aTunNd2OGIGMHmh6vOKeMuUaW
         mMQrzYuIwGXVz7XiiPbifTrYAXp2wBsj95lfaJxNWLVDP+yLuj21nsMq7nx8SPTtt3jQ
         1pXMgiiLlE1VFu8wElvBoV4Uk93QTrKYfpsu04AitFIMYjtP4kwjRdLLFZtsKQOTBFEC
         zyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7v0YRxUh2NXaEWH/1D+w+icpGMHFoR+6FAOxiREw4r0Dw0/0b0UoiV0bJwIiXsRcnNMtAyoEuXIc+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKl6MhFnoddjxIP7neccg6L2bvNwoVkwL6BgEZcJLQj6kvGps9
	zx7QUom7i/rDTd4WFgEWGhlSyYGtKvCuyzmlmgffFRDDS8A/gDqQ7zZC/dmfAwXxeYdKuADe6u0
	OP/UFXQB8WOxEwwe5FJ1TLbRJpbQWx2b/TkJb0XnDxQUtSPTAmKUU
X-Gm-Gg: ASbGncsGu7TTJPwPxyLRuzOXCRMMuaN2RTAdNwar65h+h4txznhe+wGfrsmoXvt2HRu
	jEJyh9jF4teKuNCq2fdx17+G6HOry7yGE5hk2DSsNZlWV1l5F0STnBfuJyrxyAnl090r7tk7T/2
	QKp0qVE7eMVX1xQdQgeXrdGtfyCBVsKXJFT/GXMlOhn7LCvjyA2keLWqwd10XMB2JImT2vX04OV
	29RZFps
X-Google-Smtp-Source: AGHT+IGisCuaDpdsoUYA9pYgVpfMQpgdPrniDusu9dQcSD5V9YeojvAiAiIby9Q5FLmBXxfa6GuF5BNA8l3vdExQZ3w=
X-Received: by 2002:a05:690c:ec8:b0:71e:7ee9:839a with SMTP id
 00721157ae682-71fdc2f17e3mr24348107b3.2.1755857776818; Fri, 22 Aug 2025
 03:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821-pxav3-uhs-v4-0-bb588314f3c3@dujemihanovic.xyz>
In-Reply-To: <20250821-pxav3-uhs-v4-0-bb588314f3c3@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Aug 2025 12:15:40 +0200
X-Gm-Features: Ac12FXyMkjhCU6n4TOiSQhHwXlqNLt3Ozl6PlHCodFGyP-HnVszxTjH0MYaKHjU
Message-ID: <CAPDyKFpGW58HSQkodWQqHaNU02OcaY2E7C1Kt=caLCdXkOvvuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mmc: sdhci-pxav3: pinctrl setting for fast bus clocks
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Aug 2025 at 13:20, Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz> =
wrote:
>
> Hello,
>
> This small series adds a pinctrl setting for fast MMC bus clocks to the
> pxav3 driver. On bus clocks above 100 MHz, driving the data pins at a
> higher current helps maintain signal quality.
>
> This series is related to Marvell PXA1908 SoC support merged into v6.17.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Address maintainer comments:
>   - Fix if-else braces
> - Rebase on v6.17-rc2
> - Update trailers
> - Link to v3: https://lore.kernel.org/r/20250806-pxav3-uhs-v3-0-2f03fee38=
0b0@dujemihanovic.xyz
>
> Changes in v3:
> - Address maintainer comments:
>   - Refactor driver patch
> - Remove RFC tag
> - Update trailers
> - Link to v2: https://lore.kernel.org/r/20250801-pxav3-uhs-v2-0-afc1c428c=
776@dujemihanovic.xyz
>
> Changes in v2:
> - Address maintainer comments:
>   - Newline between properties in if:
>   - Don't try to lookup pinstates if pinctrl is NULL
>   - Only change pinstates if both are valid
>   - Replace dev_warn() with dev_dbg()
> - Link to v1: https://lore.kernel.org/r/20250718-pxav3-uhs-v1-0-2e451256f=
1f6@dujemihanovic.xyz
>
> ---
> Duje Mihanovi=C4=87 (2):
>       dt-bindings: mmc: sdhci-pxa: add state_uhs pinctrl
>       mmc: sdhci-pxav3: add state_uhs pinctrl setting
>
>  .../devicetree/bindings/mmc/sdhci-pxa.yaml         | 29 +++++++++++++--
>  drivers/mmc/host/sdhci-pxav3.c                     | 41 ++++++++++++++++=
+++++-
>  2 files changed, 66 insertions(+), 4 deletions(-)
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250718-pxav3-uhs-d956bfed13f0
>
> Best regards,
> --
> Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>
