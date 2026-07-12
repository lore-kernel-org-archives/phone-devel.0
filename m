Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080725B0AF;
	Sun, 12 Jul 2026 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868716; cv=none; b=Rr9Ot56SyrXTmsAZ+yBNx6Xpl9fDJHvTvFzH0M4XSrt71IkqNxvQNJGVpjGpU8gNhGqAC4B4OBnUnRgJRJGTepIOV/g1N+tnpK/8HReFs/adbeoOcs0BvXRri5hx5uAWVcq3zmsG98eo5hlqmp+71fNWNESTcQO4A/vMRX3SveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868716; c=relaxed/simple;
	bh=HchNR5DOUBk1jVaWx3bcF2PwHQpSVgSjpgKqxoNPx00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR05//Ut03HW6cSF9wjiTMqC84sx+VLoCbuMx2oFWznzwNDRZ2GeE8VOxb2ngrvYUoR+fORo+T5NJwKDZW55ibI2EFHWerweQlwxhjv1yWUsUB9r/8ek0typG8aVrdbps1Za2WJlvGbfLhXP+UkgoA0RSB//p/cwgvFyiqd9Kuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHndfSGR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHndfSGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD9B1F000E9;
	Sun, 12 Jul 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868714;
	bh=qmXIaVnSS7N0gqrAoav4/4RdHFx2hsBr1GQgIn8p928=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PHndfSGRDaoaS5bWSiUgIc4rmh63OvWOXz9rcXRZb1Ji/14AR8eEQgi89uY1u/do8
	 ijJAVQuVvRziM5qi3ac6hdi98u8BtlS+M9PFhzB9iUD7Qm8aM0ZqFiGKVV/L2G7cfP
	 o7XqySAthCYVR9hpv+5YejlMTnzobjknEsb3ETEXh3gT73daCzFH6OmJ4zx8sNGhcb
	 nR93FieOz9cL52HMR2AyMFOFqRpHE6/tzJnc1VJQSR89N0epgN9uwJxzFM1ctgvS+l
	 GB0YncZmkF72HBj7WEpzf6bO1Gn60J6nDkYNUcBVemaHRlzm4JPtQ50qHPmP6NQTvm
	 lyXJvolqzPNYw==
Date: Sun, 12 Jul 2026 10:05:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
Message-ID: <alOtC4bjK8IWzEj2@baldur>
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>

On Fri, Jul 10, 2026 at 11:53:57AM +0200, Luca Weiss wrote:
> Add the missing reset (BCR) for sdhc_2.

Don't be afraid of tell the world why a particular change is needed...

Regards,
Bjorn

> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 8c9232988953..262fa8801256 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			iommus = <&apps_smmu 0x540 0>;
>  
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +
>  			bus-width = <4>;
>  
>  			qcom,dll-config = <0x0007442c>;
> 
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8
> 
> Best regards,
> --  
> Luca Weiss <luca.weiss@fairphone.com>
> 
