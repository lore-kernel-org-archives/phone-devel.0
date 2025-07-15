Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970A248F76
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589820; cv=none; b=f2XY7nNrZHXtcvMvCFWDX1FFnq6+BjOehfPX58oJ6AJB/TB4RfNoAcJcGhmO01mtoGuTm0ViR8V8NA9WeDnhILUwtMzToT8k9ZxWsfLe9GVLVsN0NhmR2X2PxVfycE0mbKcCCarDFEwczqbK4kDsfmT6mddIrL4uDHOQR1K+2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589820; c=relaxed/simple;
	bh=FdL1/HKNTpO4kdE7n4NKm5VaVSkDlbNs48yc+1QgZas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J92g6UNh6sHCWUlUdpAh+HmGzSFmNrudVtTyTYos/rZyATD8asHpPfP+Y8TrsXx7lpOUkBFzGfHAC5QjU3rewdn2wOlc17ZXFirZKOJ32G8RAG0dMUa9OfAAsn8A3R59u7ESVdYdNwkh3tcGQh/afAfJeDB5LnkykfjLtYbIYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2v2bzED; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2v2bzED"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8bbaedb460so495776276.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752589817; x=1753194617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=W2v2bzED3A9ejC4TfbgBBjzjno/K1PhLK2E7O3e0SPUbLWqTR9Evxz9A+K/rXmm1Gp
         Et22K0hwMJdya3IKeHHsXW3hPwxvGaAhOYHBmyAS8ncFcpUbQerWd0RUW9AbdeTrB6sG
         QOUikyYzPsid/y34PVziDdUyKm1BoNauuudY42lVMegWroSPQOo3Qkr6ygEYUTk7hnPm
         kY02nYoNhhonMX9fIknHS1fRHnqETyvy/jv6p/jTCFbethMcmYb0L5oWZWuzyDkW6sow
         OmLBsjvk6glkP806VpmbDr5DbkxrIKVAvgata5YVlC/7rRECoPR3Rnlb3ulchSSzVxCG
         mZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589817; x=1753194617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=NnBegF4AGNwZJPgP8wpPX8TdgB/OoqZR1Qz9kbg2BActNh8dcF7fK1D97Gx2lEVgEC
         HGf4vwb8asnEITKWNaNT5cbPgdKWlXoFIFvOdElYkjsgXi+GhduQcwtaxVx22H4roycx
         IpL2o2Q8pq5izHQEAx2bnPfgYu7MBxrypuKoDwf2vAZOpIVOh8HcqAjiHT6eHXxVsSSA
         rK9FzDMVZ55kLiyA1jmcIhyFGPpLAZvxmSf+vb4+wrJE1aHZVdYq9rbuVQHXafvGE0XB
         3TAmmbdkXuhJpBkYoAZgTeD5ROjsaltJZ9Tew057Ij/NCN2dVq/CKyQJE3sd0Sq4721b
         yYLg==
X-Forwarded-Encrypted: i=1; AJvYcCX7JJ9o3InmKDvj3d9I1qCE4Ui1tFdOz59eh0hapawiY+SQxXBr58gfgyi1M0O69nqxSlmu6DL7FcoFbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCatLYHxAUejEeyJ+cIW3MQvaietwu8UjrIHCi6NyABx1O31FE
	zDKCyK9tBWNcWAeYkkSed4aRSfR9Gk+ckI+wHMZgjEMmlxiPmI2i2Bi5qT1KUVfsbWuRNU6oAzo
	1b6dWyPb2h2CjwxfNeAOPta1LBjXCtNUkUN40cJaTmQ==
X-Gm-Gg: ASbGnctDaYFfha1V54l9Q9qNZj5cMCwdL/PL4pBtwNYb+nQQdSERaTIg00FCr+LHtDo
	f+hJFTtbr3GQeb7Q+FRPe8IpAYe0Z5dIE50wppdUwMZISp5KmohgtRR3pEC5aFNI676uK++9Yri
	3OUWHrYEuBisnGQPQERdZp/codscv301NmNTuq03Nnpcp6WtPm3kJY2em0u4OI3hrKgtqUSkTDO
	N59T6As
X-Google-Smtp-Source: AGHT+IGBzBhoCXe5OGunO7xvl2ZbN7LRPwWWQsLELIyQWERT2XuyowSM7Ti1rVh+eETJFMAPU2ltq9fvUbOvfY7jIrI=
X-Received: by 2002:a05:690c:9:b0:718:2387:4544 with SMTP id
 00721157ae682-71823874737mr49946387b3.12.1752589816638; Tue, 15 Jul 2025
 07:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com> <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 16:29:40 +0200
X-Gm-Features: Ac12FXwmHbA2nWRNuYQwrZTMO008mwPCFYz6i2upkNA2qncGOOVsk9AzGvxKlLM
Message-ID: <CAPDyKFo77_0n0SefZ0N3osbSM=0tXW_rsjd9P4WaqoZAwyaTGg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: mmc: sdhci-msm: document the Milos
 SDHCI Controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Jul 2025 at 10:07, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Document the SDHCI Controller on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b70b96b98c042109b10ead26e2291..6f3fee4929ea827fd75e59f31527f96b79b2cca8 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -42,6 +42,7 @@ properties:
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
> +              - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
>
> --
> 2.50.1
>
