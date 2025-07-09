Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12022D9499
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060692; cv=none; b=GZ1a5cy0lm3zs2S5SUO7zYTkH+da1tSBW+6Ka8DcNDJeNbYA5k6VSzSXVplo64/trbUd7kj2i5Ak1hLGsauoAGGIYnFF7EOc5F/LVtRKCPJciu8Wv/SPN+sfhlaHXGWpe+kRaCtQ20QWN0gphsOLxZFst44erDG0Wocgtwervkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060692; c=relaxed/simple;
	bh=KC3Z6R9qM6d7cSIbmQ52PjX+ds9juhkme3cOPH/FE0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZ/I4e7kB5UXbXwvNh0Z4Az7RYws83b72hgMzlQVFNT/9URndmytyjrMLpxVXReUB14hCbdLDO6HEaPfl8Ak64Q0D1COedWOCEZNnO1s1Ld3U+3fed/v+0wFCPlW6vAYydNvfCr1EyWRP9fUkdOnY2jnHRztMVoNfCovZIly49o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4zvvMFw; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4zvvMFw"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e5d953c0bso58575997b3.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060690; x=1752665490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4qDIkCxD7aqIeJI126uepcAwUwJhAjQhx18iyCLj3I=;
        b=d4zvvMFwQWq5AtwhSFVZlEp2VsvEL4yY6W4uvGlxWtC4VC5WEd916YWS+qtBYC4505
         nJbWun+f95puMGOb8sVtFFdXWhQ+BzYzbxg16VSS8+ZaEfmNWCEwa9GGtOagKTz24KKC
         HsraMdu6Mh4VNXMALvfa0I3NuThWMsEQjdK35pKEmf89rfWM6OphJFs6HVc8zyP7CS04
         FNqUgHOQ6QJ0WG23eVrr6jvL6bYgiTea4NCdQtq6DfUng4s4AjKrhHtDWpjDz7pHZXSr
         P5RiYoAYwNGHLyhWmNOaaNXTNBLu3pYnTovmikJVUehgGPUx8ld4nY8KZfYEnuKEaPgN
         rBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060690; x=1752665490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4qDIkCxD7aqIeJI126uepcAwUwJhAjQhx18iyCLj3I=;
        b=ao4xmC/f/A/AYV8ZRZGfSIqas4oduthQXY4iodgDExxFiVwB8gq8sZfPqR2xFx888x
         vDK0UleCR7zihWUeqGjVNH37zH1bCclmzOOR2IzJtab8wVk/sQPhRsq+CqnrKSdiod67
         KDdl6zn94xcAajwzkslx/Xvhz2WMSzrAbmMB2XLZXU7N7/9Vg/L9/JpiGNY+A9Y4UZQR
         y3eCwpw+yYuCfYHFk38VP2HuncY8zMj8c/uwQ/Co1ODwB4C6gvjiX8do6qkrvhO51LPq
         EWjp+nMD2iQYPVrP8EODdU/yU0EB4IMw56a2dZKTjTHwDnC7bF+omQ7NcXQFm9RhjgRC
         CtEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVerLpXpq0WmDWM7U+6zXXTRm3FS7kiMn5a+1OTCUspSjxfqMC/Ph9wD1oxlU+MgFWTdHMpccjIXztIHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYXTGeCfV59dLBXwWVEtweUWCegRVmfAeMtb0xwwQ4Z8tFq5n
	12IwZhfHZARsv8eYEurxGq0ge/UInjoApH7NtgIZhwS94BRF05tphMTBPLsd8iCPdLA1KFETqlY
	dKhSDW9LU3m0OMWYMJcSggP5mT2J1Bax+lVWe+EcdbA==
X-Gm-Gg: ASbGncv/EhWEFwMp52uk88jsnSUj1Uw3at8exckqFzvFkIyFi5zVJojw9FDVz0yCyls
	JOpwlzsHL/RC9gBu6iqAEgcQN1BINYBb7dOaniWVpnHQUoJOSp0Th2uWtzsxQbNWSjKYP7H4JeA
	uREg+hKy8OTrCHDYSshYF/x7YL3x89STIdJeI+4o5Gn//d
X-Google-Smtp-Source: AGHT+IGEJ4mmuKS7rt1MFlUz2bfdy5YmSqNFhku/Q0Up5ig+Hhd1s6mTWPeVIQL/2Z6ktbTHNLkVtt8rYKM0Ty9sofo=
X-Received: by 2002:a05:690c:34c1:b0:70f:83ef:ddf7 with SMTP id
 00721157ae682-717b1ba3c3emr33058457b3.13.1752060689721; Wed, 09 Jul 2025
 04:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:52 +0200
X-Gm-Features: Ac12FXxRo-xD5eCPtXLrowuQGz-kjsQVt_Zu_iyEtrGYNOPit2r7unOQDND3zzc
Message-ID: <CAPDyKFonLENQbafjo621hHPkoWjMNoQ5GRNeNndpezMNnM1=sA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Milos RPMHPD power domains
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 12:18, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add support for the rpmhpd power domains in the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

The series applied for next (with a minor update to the commit message
for patch1, according to suggestions from Krzysztof), thanks!

Kind regards
Uffe



> ---
> Changes in v2:
> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com
>
> ---
> Luca Weiss (2):
>       dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Domains
>       pmdomain: qcom: rpmhpd: Add Milos power domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2
>
> Best regards,
> --
> Luca Weiss <luca.weiss@fairphone.com>
>
