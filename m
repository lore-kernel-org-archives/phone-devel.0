Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3D33DEDD
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066996; cv=none; b=WWNNgvlu8aX+Ef3o8icvNvsE7UxcrQaQGORfcwISfkcWu9YCFd3Gslt2jYRCIoaYmLKi7qdPz0uRcoG2VtcglNFD6+7vPcWIBCqllIghF4LN6eFnqk5H4tHbDkgJrIPjYZbSxPLNcwyoa97mfiD5cnE7ie0MKIeYnbL0I2TdtU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066996; c=relaxed/simple;
	bh=dpLZWrqIrTtgmUu6AZ/eaVvNYP+es/ibZq3L+MK+Pis=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiW+zINdVvQNkDLIzCAUtRcKTPSksZC8kEjN77xgEwqyrvtNgz5XGltCehlhDEPhPidsg5SdLoKSNOk5SUPdq222vN8WNBCDR54Elteqy3l6Pvq+/gn3GGGbtg/vIlX101p+7yBU1lJuRGnHlPGVdssSZKfr2fF7LXhbUc4VRsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUfoYskr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUfoYskr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656251F00A3D
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066994;
	bh=sk/1UlzFWrCnzpIJcdD6UDb2RzZXkwSbPTb878tf5xI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nUfoYskrboE5aNOH76O1+qfMzDW5cD6LuxtIqmF8OGFOlFpfGrP53/gFFOlleBOBt
	 NWkG5Xi7nZdSQlmIrCfjH1URPH1MpXbNklcwYp2zBlt+Zv4hSaXweicSPk3Txx0dqQ
	 tdclrn/LjJdT1bCpBcEBr1/ds4EGABEf21hUH6BModEUKNJb9pjO7v+F4KG6H/jBfJ
	 3glBsTLfMgB04wS8Nq1XMumHZWUOBvub0uCMSqr7rMwSGuvVWaYMQ9uYDOg7Cspvhx
	 NYG4Kk2TBRAjqTey5yVFqJvpDC39vjVMviREWAcGgf263I6kGE+nJLBJvb7tAMCEn8
	 xb0jpAJiTtF6A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd77cbb4so277360e87.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 01:23:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLvd8gcrTz8x9g7mrapfSqeSIt7bifWlLz7zighsNz31opKjM+oDtSbksd5db34F6H+DbvWERACE9eCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HEUTWmfxeQNjia/Xp2rmoWdKLSkAf9BRPEc1NNuMVV9zmM7Q
	rLlrAkAjfMAAmmKEe0uwcGDglgRuyMeNhTlW73mAd8y268jlANVMy3UipJC3bjogu4EjB0AqldJ
	k42ptmzBxIoKdEKRuAVd3eS9aYhVmFdOI4Q54FxMNdw==
X-Received: by 2002:a05:6512:6304:b0:5ae:c210:1a19 with SMTP id
 2adb3069b0e04-5aec67978bfmr2167934e87.12.1783066993200; Fri, 03 Jul 2026
 01:23:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:23:11 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:23:11 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-sm7125-samsung-v1-1-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com> <20260703-sm7125-samsung-v1-1-3e5f752048c1@gmail.com>
Date: Fri, 3 Jul 2026 03:23:11 -0500
X-Gmail-Original-Message-ID: <CAMRc=McZwqbmW80+3MzOyNpPoOtVHZs4NXo1K6jftgpTr-dcgg@mail.gmail.com>
X-Gm-Features: AVVi8CdqossYlhJsGyQqyiZfB45JB-hXKE0Ikmy7typJ9NInRf0EIlTHHvfC-II
Message-ID: <CAMRc=McZwqbmW80+3MzOyNpPoOtVHZs4NXo1K6jftgpTr-dcgg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 09:59:38 +0200, Erikas Bitovtas <xerikasxx@gmail.com> said:
> Add compatibles for Samsung Galaxy A52 and A72.
>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 667607ae2c32..ec3d9be06dd9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1036,6 +1036,8 @@ properties:
>
>        - items:
>            - enum:
> +              - samsung,a52q
> +              - samsung,a72q
>                - xiaomi,curtana
>                - xiaomi,joyeuse
>            - const: qcom,sm7125
>
> --
> 2.55.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
